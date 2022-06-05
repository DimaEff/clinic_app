import 'package:clinic_app/domain/user.dart';

import './appointment.dart';

class Doctor extends User {
  String specialty;
  String education;
  String experience;
  List<Appointment> appointments;


  Doctor({
    required String name,
    String role = 'doctor',
    required this.education,
    required this.experience,
    required this.specialty,
    required this.appointments,
  }) : super(name: name, role: role);
}
