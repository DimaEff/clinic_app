import 'package:flutter/material.dart';

import '../components/doctors-list/doctor-list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('Clinic'),
          leading: Icon(Icons.medication_outlined),
        ),
        body: DoctorList(),
      ),
    );
  }
}
