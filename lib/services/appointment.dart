import 'package:clinic_app/domain/appointment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IsAppointmentDateValid {
  bool isWorkHoursValid;
  bool isAppointmentTimeNotExists;

  IsAppointmentDateValid(
      {required this.isWorkHoursValid,
      required this.isAppointmentTimeNotExists});
}

class AppointmentService {
  final CollectionReference<Map<String, dynamic>> collection =
      FirebaseFirestore.instance.collection('appointments');

  Future<IsAppointmentDateValid> isAppointmentDateValid(String date, String spec) async {
    var apposAll = await getAppoinments();
    var appos = apposAll.where((e) => e.specialty == spec).toList();
    var appoDate = DateTime.parse(date);

    var isWorkHoursValid = _checkIsWorkingHoursValid(appoDate);
    var isAppointmentTimeNotExists =
        _checkIsAppointmentTimeNotExists(appoDate, appos);

    return IsAppointmentDateValid(
      isWorkHoursValid: isWorkHoursValid,
      isAppointmentTimeNotExists: isAppointmentTimeNotExists,
    );
  }

  bool _checkIsWorkingHoursValid(DateTime date) {
    var weekDay = date.weekday;
    var hour = date.hour;
    if (weekDay == 6 || weekDay == 7) {
      return hour > 9 && hour < 16;
    } else {
      return hour > 8 && hour < 20;
    }
  }

  bool _checkIsAppointmentTimeNotExists(
      DateTime date, List<Appointment> appos) {
    bool check(Appointment appo) {
      var startDate = DateTime.parse(appo.start);
      var finishDate = DateTime.parse(appo.start).add(Duration(minutes: 10));
      print(date.toString());
      print(startDate.toString());
      print(finishDate.toString());
      return startDate.isAfter(date) || finishDate.isBefore(date);
    }

    bool res = true;
    for (final appo in appos) {
      if (!check(appo)) {
        res = false;
      }
    }

    return res;
  }

  Future<List<Appointment>> getAppoinments() async {
    var res = await collection.get();
    return res.docs.map((event) => fromJson(event.data())).toList();
  }

  Stream<List<Appointment>?> getAllAppoinments() {
    return collection
        .snapshots()
        .map((event) => event.docs.map((e) => fromJson(e.data())).toList());
  }

  Future<void> createAppointment(
      String patientId, String doctorId, String start, String specialty) async {
    collection.doc().set({
      'start': start,
      'doctorId': doctorId,
      'patientId': patientId,
      'specialty': specialty,
    });
  }

  Appointment fromJson(Map<String, dynamic> event) {
    return Appointment(
      start: event['start'],
      doctorId: event['doctorId'],
      patientId: event['patientId'],
      specialty: event['specialty'],
    );
  }
}
