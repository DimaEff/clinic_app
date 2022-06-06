import 'dart:async';

import 'package:clinic_app/domain/patient.dart';
import 'package:clinic_app/services/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UsersService _usersService = UsersService();

  void _showErrorToast(String msg) {
    Fluttertoast.showToast(
        msg: 'Ошибка $msg',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<Patient> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return _getPatient(result.user);
    } catch (e) {
      print(e);
      _showErrorToast('авторизации');
      rethrow;
    }
  }

  Future<dynamic> createUserWithEmailAndPassword(
      String email, String name, String password, String snils, String passport) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user?.uid;
      if (uid != null) {
        await _usersService.createUser(uid, name, snils, passport);
      }
      return _getPatient(result.user);
    } catch (e) {
      _showErrorToast('регистрации');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _showErrorToast('выхода из приложения');
      rethrow;
    }
  }

  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Stream<User?> getUser() {
    return _auth.authStateChanges();
  }

  Stream<Future<Patient?>> getPatient() {
    return _auth.authStateChanges().map((event) async {
      var id = event?.uid;
      if (id != null) {
        return _usersService.getPatient(id);
      }
    });
  }

  Stream<dynamic>? getUserMap() {
    Stream<dynamic>? stream;
    _auth.authStateChanges().listen((event) {
      if (event != null) {
        stream = _usersService.collection.doc(event.uid).snapshots().map((event) => event.data());
      }
    });

    return stream;
  }

  // Stream<dynamic> getCurrentUser() {
    // var controller = _usersService.getPatient(uid);
    // _auth.authStateChanges().listen((event) async {
    //   String? id = event?.uid;
    //   if (id != null) {
    //   }
    // });
    //
    // return streamController.stream;
  // }

  Future<Patient> _getPatient(User? user) async {
    Patient? patient;
    if (user != null) {
      print(user);
      patient = await _usersService.getPatient(user.uid);
    }

    if (patient == null) {
      throw Error();
    }

    return patient;
  }
}
