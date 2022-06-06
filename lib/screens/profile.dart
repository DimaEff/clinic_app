import 'package:clinic_app/components/common/button.dart';
import 'package:clinic_app/components/common/input.dart';
import 'package:clinic_app/domain/patient.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:clinic_app/services/users.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _snilsController = TextEditingController();
  TextEditingController _passportController = TextEditingController();

  AuthService _authService = AuthService();
  UsersService _usersService = UsersService();

  Patient? patient;

  setName() {
    _authService.getPatient().listen((event) async {
      var p = await event;
      if (p != null) {
        setState(() {
          patient = p;
          _nameController.text = p.name;
          _snilsController.text = p.snils;
          _passportController.text = p.passport;
        });
      }
    });
  }

  void makeChanges() async {
    _authService.getPatient().listen((event) async {
      var p = await event;
      if (p != null) {
        await _usersService.updateUser(
          p.id,
          _nameController.text.trim(),
          _snilsController.text.trim(),
          _passportController.text.trim(),
        );
      }
    });
  }

  @override
  void initState() {
    setName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Image(
                width: 100,
                image: NetworkImage(
                    'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 50),
                child: Input(
                  controller: _nameController,
                  icon: Icon(Icons.account_circle),
                  hint: 'name',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Input(
                  controller: _snilsController,
                  icon: Icon(Icons.margin_rounded),
                  hint: 'snils',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                child: Input(
                  controller: _passportController,
                  icon: Icon(Icons.perm_contact_cal_rounded),
                  hint: 'passport',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 50,
                  width: 200,
                  child: Button(
                    label: 'Изменить',
                    onPressed: makeChanges,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}