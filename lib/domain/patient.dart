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
  String snils;
  String passport;

  Patient({required super.id, required super.name, required this.snils, required this.passport}) : super(role: 'patient');
}