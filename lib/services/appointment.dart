import 'package:clinic_app/domain/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentService {
  final CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection('appointments');

  Future<List<Appointment>> getAppoinments() async {
    var res = await collection.get();
    return res.docs.map((event) => fromJson(event.data())).toList();
  }

  Stream<List<Appointment>?> getAllAppoinments() {
    return collection.snapshots().map((event) => event.docs.map((e) => fromJson(e.data())).toList());
  }

  Future<void> createAppointment(String patientId, String doctorId, String start, String specialty) async {
    collection.doc().set({
      'start': start,
      'finish': 'finish',
      'doctorId': doctorId,
      'patientId': patientId,
      'specialty': specialty,
    });
  }

  Appointment fromJson(Map<String, dynamic> event) {
    return Appointment(
        start: event['start'],
        finish: event['finish'],
        doctorId: event['doctorId'],
        patientId: event['patientId'],
        specialty: event['specialty'],
    );
  }
}
