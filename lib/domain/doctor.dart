import 'package:clinic_app/domain/user.dart';

import './appointment.dart';

class Doctor extends User {
  String specialty;
  String education;
  String experience;
  List<Appointment> appointments;


  Doctor({
    required super.id,
    required super.name,
    String role = 'doctor',
    required this.education,
    required this.experience,
    required this.specialty,
    required this.appointments,
  }) : super(role: 'doctor');
}
