import 'package:clinic_app/services/auth.dart';
import 'package:flutter/material.dart';

import '../components/doctors-list/doctor-list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text('DimaEff'),
          leading: GestureDetector(
            onTap: _authService.signOut,
            child: Icon(Icons.logout),
          ),
        ),
        body: DoctorList(),
      ),
    );
  }
}
