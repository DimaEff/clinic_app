import 'package:clinic_app/screens/auth.dart';
import 'package:clinic_app/screens/home.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isAuth = false;

    return isAuth ? HomePage() : AuthPage();
  }
}
