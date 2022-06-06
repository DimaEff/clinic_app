import 'package:clinic_app/components/doctors-list/doctor-list-item.dart';
import 'package:clinic_app/domain/appointment.dart';
import 'package:flutter/material.dart';
import 'package:clinic_app/domain/doctor.dart';

class DoctorList extends StatelessWidget {
  DoctorList({Key? key}) : super(key: key);

  final doctors = <Doctor>[
    Doctor(
        id: '123',
        name: 'Alex',
        education: 'Mining Un',
        experience: '26',
        specialty: 'Уролог',
        appointments: [
          Appointment(start: DateTime.now(), finish: DateTime.now()),
          Appointment(start: DateTime.now(), finish: DateTime.now()),
        ]),
    Doctor(
        id: '123',
        name: 'Maria',
        education: 'Mining Un',
        experience: '2',
        specialty: 'Терапевт',
        appointments: [
          Appointment(start: DateTime.now(), finish: DateTime.now()),
          Appointment(start: DateTime.now(), finish: DateTime.now()),
        ]),
    Doctor(
        id: '123',
        name: 'Sam',
        education: 'Mining Un',
        experience: '15',
        specialty: 'Оккулист',
        appointments: [
          Appointment(start: DateTime.now(), finish: DateTime.now()),
          Appointment(start: DateTime.now(), finish: DateTime.now()),
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, i) {
          return DoctorListItem(doctor: doctors[i]);
        },
      ),
    );
  }
}
