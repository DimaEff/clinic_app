import 'package:clinic_app/domain/doctor.dart';
import 'package:flutter/material.dart';

class DoctorListItem extends StatelessWidget {
  const DoctorListItem({Key? key, required this.doctor}) : super(key: key);

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(doctor.name),
            leading: Container(
              padding: EdgeInsets.symmetric(),
              child: Text(doctor.specialty),
            ),
          ),
        )
    );
  }
}
