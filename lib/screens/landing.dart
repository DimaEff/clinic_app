import 'package:clinic_app/screens/auth.dart';
import 'package:clinic_app/screens/doctor.dart';
import 'package:clinic_app/screens/home.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthService _authService = AuthService();

  setUser() {
    _authService.getPatient().listen((event) async {
      var p = await event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data?.email?.toString().substring(0, 3));
              bool isDoc = snapshot.data?.email?.toString().substring(0, 3) == 'doc';
              print(isDoc);
              return snapshot.hasData ? (isDoc ? DoctorPage(email: snapshot.data?.email) : HomePage()) : AuthPage();
            })
    );
  }
}
