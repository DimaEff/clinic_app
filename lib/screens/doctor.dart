import 'package:clinic_app/components/appointment-list/appointment-list.dart';
import 'package:clinic_app/components/common/button.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/appointment-list/doc-appointment-list.dart';
import '../domain/doctor.dart';

class DoctorPage extends StatefulWidget {
  DoctorPage({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  AuthService _authService = AuthService();

  Doctor? _doctor;
  bool appo = false;

  @override
  void initState() {
    setState(() {
      _doctor = Doctors().findByEmail(widget.email);
    });
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
              child: DocAppointmentList(spec: _doctor!.specialty),
          ): Column(
                  children: [
                    Image(
                        image: NetworkImage(
                            'https://www.gostudy.cz/wp-content/themes/gostudy_eighteen/assets/pages/doctors/images/doctor-cut.png')),
                    Text(_doctor!.specialty),
                    Text('${_doctor!.experience} лет опыта'),
                    Button(label: 'Записи', onPressed: () => setState(() {
                      appo = true;
                    })),
                  ],
                ),
        ),
      ),
    );
  }
}
