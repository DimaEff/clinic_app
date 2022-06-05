import 'package:clinic_app/components/doctors-list/doctor-list.dart';
import 'package:flutter/material.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DoctorList();
  }
}
