import 'package:clinic_app/domain/patient.dart';
import 'package:clinic_app/screens/appointment.dart';
import 'package:clinic_app/screens/clinic.dart';
import 'package:clinic_app/screens/doctors.dart';
import 'package:clinic_app/screens/profile.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:clinic_app/services/users.dart';
import 'package:flutter/material.dart';

import '../components/doctors-list/doctor-list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService _authService = AuthService();
  UsersService _usersService = UsersService();

  int _page = 0;
  final _pages = <Widget>[
    ProfilePage(),
    ClinicPage(),
    AppointmentPage(),
    DoctorsPage(),
  ];

  String name = 'name1';
  // setName() {
  //   _authService.getPatient().listen((event) async {
  //     var p = await event;
  //     var n = p?.name;
  //     if (n != null) {
  //       setState(() {
  //         name = n;
  //       });
  //     }
  //   });
  // }

  @override
  void initState() {
    // setName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(name),
          leading: GestureDetector(
            onTap: _authService.signOut,
            child: Icon(Icons.logout),
          ),
        ),
        body: _pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          onTap: (int index) {
            setState(() => _page = index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Профиль',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_rounded),
              label: 'Поликлиника',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outlined),
              label: 'Записаться',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_information),
              label: 'Доктора',
            ),
          ],
        ),
      ),
    );
  }
}
