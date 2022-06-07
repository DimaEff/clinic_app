import 'package:clinic_app/components/appointment-list/appointment-list.dart';
import 'package:clinic_app/components/common/button.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:clinic_app/services/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/appointment-list/doc-appointment-list.dart';
import '../domain/doctor.dart';

class DoctorPage extends StatefulWidget {
  DoctorPage({Key? key, required this.uid}) : super(key: key);

  final String uid;

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  AuthService _authService = AuthService();
  UsersService _usersService = UsersService();
  Doctors _doctors = Doctors();

  bool appo = false;

  Doctor? doc;
  String? specialty;
  String? experience;
  String? education;
  setDoctor() {
    // _authService.getDoctor().listen((d) async {
    //   var doc = await d;
    //   var specialty = doc?.specialty;
    //   var experience = doc?.experience;
    //   var education = doc?.education;
    //   if (specialty != null && experience != null && education != null) {
    //     print(specialty);
    //     setState(() {
    //       print(specialty);
    //       specialty = specialty;
    //       experience = experience;
    //       education = education;
    //     });
    //   }
    // });
  }

  @override
  void initState() {
    setState(() {
      doc = _doctors.findById(widget.uid);
    });
    setDoctor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: _authService.signOut,
          child: Icon(Icons.logout),
        ),
      ),
      body: Container(
        child: Center(
          child: appo
              ? GestureDetector(
                  onPanUpdate: (details) {
                    // Swiping in left direction.
                    if (details.delta.dx < 0) {
                      setState(() {
                        appo = false;
                      });
                    }
                  },
                  child: DocAppointmentList(spec: doc?.specialty ?? '1'),
                )
              : Column(
                  children: [
                    Image(
                        image: NetworkImage(
                            'https://www.gostudy.cz/wp-content/themes/gostudy_eighteen/assets/pages/doctors/images/doctor-cut.png')),
                    Text(doc?.specialty ?? '1'),
                    Text(doc?.education ?? '1'),
                    Text('${doc?.experience ?? '1'} лет опыта'),
                    Button(
                        label: 'Записи',
                        onPressed: () => setState(() {
                              appo = true;
                            })),
                  ],
                ),
        ),
      ),
    );
  }
}
