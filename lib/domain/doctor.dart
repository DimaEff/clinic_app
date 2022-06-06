import 'package:clinic_app/domain/user.dart';

import './appointment.dart';

class Doctor extends User {
  String email;
  String specialty;
  String education;
  String experience;


  Doctor({
    required this.email,
    required super.id,
    required super.name,
    String role = 'doctor',
    required this.education,
    required this.experience,
    required this.specialty,
  }) : super(role: 'doctor');
}
