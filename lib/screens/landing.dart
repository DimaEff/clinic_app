import 'package:clinic_app/domain/doctor.dart';
import 'package:clinic_app/screens/auth.dart';
import 'package:clinic_app/screens/doctor.dart';
import 'package:clinic_app/screens/home.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:clinic_app/services/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  AuthService _authService = AuthService();
  UsersService _usersService = UsersService();

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
              bool isDoc = snapshot.data?.email?.toString().substring(0, 3) == 'doc';
              return snapshot.hasData ? (isDoc ? DoctorPage(uid: snapshot.data?.uid) : HomePage()) : AuthPage();
            })
    );
  }
}
