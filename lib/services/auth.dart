import 'package:clinic_app/domain/user.dart' as MyUser;
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

  Future<dynamic> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print(e);
      _showErrorToast('авторизации');
      rethrow;
    }
  }

  Future<dynamic> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user?.uid;
      if (uid != null) {
        _usersService.createUser(uid, name);
      }
      return result.user;
    } catch (e) {
      print(e);
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

  Stream<User?> getCurrentUser() {
    return _auth.authStateChanges();
  }
}
