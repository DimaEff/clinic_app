import 'package:clinic_app/screens/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ClinicApp());
}

class ClinicApp extends StatelessWidget {
  const ClinicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClinicApp',
      home: LandingPage(),
      theme: ThemeData(
          primaryColor: Colors.blue,
          backgroundColor: Colors.white,
          buttonColor: Color.fromRGBO(9, 49, 112, 1),
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.black),
          )),
    );
  }
}
