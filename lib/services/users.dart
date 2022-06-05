import 'package:cloud_firestore/cloud_firestore.dart';

class UsersService {
  final CollectionReference<Map<String, dynamic>> _collection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(String id, String name, String snils, String passport) async {
    final userDoc = _collection.doc(id);
    await userDoc.set({
      'name': name,
      'snils': snils,
      'passport': passport,
      'role': 'patient',
    });
  }

  Future<void> addedAppointment(
      DateTime start, String patientId, String doctorId) async {

  }
}
