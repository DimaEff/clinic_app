import 'dart:async';

import 'package:clinic_app/domain/doctor.dart';
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

  Future<Doctor?> getDoctor(String uid) async {
    Doctor? doctor;
    var ui = await collection.doc(uid).get();
    var data = ui.data();
    if (data != null) {
      doctor = doctorFromJson(uid, data);
    }

    return doctor;
  }

  Future<void> createDoctor(
    String id,
    String name,
    String education,
    String experience,
    String specialty,
  ) async {
    final userDoc = collection.doc(id);
    await userDoc.set(_getDoctorObject(name, education, experience, specialty));
  }

  Future<void> createPatient(
    String id,
    String name,
    String snils,
    String passport,
  ) async {
    final userDoc = collection.doc(id);
    await userDoc.set(_getPatientObject(name, snils, passport));
  }

  Future<void> updatePatient(
    String id,
    String name,
    String snils,
    String passport,
  ) async {
    final userDoc = collection.doc(id);
    var usrObj = {
      'name': name,
      'snils': snils,
      'passport': passport,
    };
    await userDoc.update(usrObj);
  }

  Future<void> addedAppointment(
    DateTime start,
    String patientId,
    String doctorId,
  ) async {}

  Future<Map<String, dynamic>?> getPatientInfo(String id) async {
    var res;
    collection.doc(id).snapshots().map((event) => event.data()).listen((event) {
      res = event;
    });
    return res;
  }

  Doctor doctorFromJson(String id, Map<String, dynamic> user) {
    return Doctor(
      id: id,
      name: user['name'],
      education: user['education'],
      specialty: user['specialty'],
      experience: user['experience'],
      email: 'email',
    );
  }

  Patient patientFromJson(String id, Map<String, dynamic> user) {
    return Patient(
      id: id,
      name: user['name'],
      snils: user['snils'],
      passport: user['passport'],
    );
  }

  dynamic _getPatientObject(String name, String snils, String passport) {
    return {
      'name': name,
      'snils': snils,
      'passport': passport,
      'role': 'patient',
    };
  }

  dynamic _getDoctorObject(
      String name, String education, String experience, String specialty) {
    return {
      'name': name,
      'experience': experience,
      'specialty': specialty,
      'education': education,
      'role': 'doctor',
    };
  }
}
