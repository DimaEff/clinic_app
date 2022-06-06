import 'dart:async';

import 'package:clinic_app/domain/patient.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersService {
  final CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection('users');

  Future<Patient?> getPatient(String uid) async {
    Patient? patient;
    var ui = await collection.doc(uid).get();
    var data = ui.data();
    if (data != null) {
      patient = patientFromJson(uid, data);
    }

    return patient;
  }

  Future<void> createUser(
      String id, String name, String snils, String passport) async {
    final userDoc = collection.doc(id);
    await userDoc.set(_getUserObject(name, snils, passport));
  }

  Future<void> updateUser(
      String id, String name, String snils, String passport) async {
    final userDoc = collection.doc(id);
    var usrObj = {
      'name': name,
      'snils': snils,
      'passport': passport,
    };
    print(usrObj);
    await userDoc.update(usrObj);
    // await userDoc.update(_getUserObject(name, snils, passport));
    // final userDoc = collection.doc('uwY3aiJpmiQtWwXVgJJcYGeCIdQ2');
    // await userDoc.update({
    //   'name': 'QweQwe1',
    //   'snils': '123123123123123',
    //   'passport': '123123123'
    // });
  }

  Future<void> addedAppointment(
      DateTime start, String patientId, String doctorId) async {}

  Future<Map<String, dynamic>?> getPatientInfo(String id) async {
    var res;
    collection.doc(id).snapshots().map((event) => event.data()).listen((event) {
      res = event;
    });
    return res;
  }

  Patient patientFromJson(String id, Map<String, dynamic> user) {
    return Patient(
      id: id,
      name: user['name'],
      snils: user['snils'],
      passport: user['passport'],
    );
  }

  dynamic _getUserObject(String name, String snils, String passport) {
    return {
      'name': name,
      'snils': snils,
      'passport': passport,
      'role': 'patient',
    };
  }
}
