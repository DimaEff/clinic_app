import 'package:clinic_app/domain/appointment.dart';
import 'package:clinic_app/domain/user.dart';

class PatientAppointment {
  String specialty;
  Appointment appointment;

  PatientAppointment({
    required this.specialty,
    required this.appointment,
  });
}

class Patient extends User {
  PatientAppointment appointment;
  Patient({required super.name, required super.role, required this.appointment});
}