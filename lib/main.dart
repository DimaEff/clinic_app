import 'package:clinic_app/components/doctors-list/doctor-list.dart';
import 'package:flutter/material.dart';

void main() => runApp(ClinicApp());

class ClinicApp extends StatelessWidget {
  const ClinicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClinicApp',
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.blue,
        backgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        )
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(title: Text('Clinic'), leading: Icon(Icons.medication_outlined),),
        body: DoctorList(),
      ),
    );
  }
}

