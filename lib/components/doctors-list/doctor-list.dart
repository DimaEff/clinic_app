import 'package:clinic_app/components/doctors-list/doctor-list-item.dart';
import 'package:clinic_app/consts.dart';
import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  DoctorList({Key? key}) : super(key: key);
  Doctors _docters = Doctors();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _docters.doctors.length,
        itemBuilder: (context, i) {
          return DoctorListItem(doctor: _docters.doctors[i]);
        },
      ),
    );
  }
}
