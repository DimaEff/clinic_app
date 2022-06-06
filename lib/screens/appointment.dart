import 'package:clinic_app/components/common/button.dart';
import 'package:clinic_app/components/common/input.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/services/appointment.dart';
import 'package:clinic_app/services/auth.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  AuthService _authService = AuthService();
  AppointmentService _appointmentService = AppointmentService();

  Doctors _doctors = Doctors();
  String? dropdownValue;

  String? selectedDate = DateTime.now().toString();
  String? patientId;
  setId() {
    _authService.getPatient().listen((event) async {
      var p = await event;
      var id = p?.id;
      print(p);
      print(p?.id);
      if (id != null) {
        setState(() {
          patientId = id;
        });
      }
    });
  }

  Future<void> appointment() async {
    var doctorId =
        _doctors.doctors.firstWhere((e) => e.specialty == dropdownValue).id;
    if (patientId != null) {
      await _appointmentService.createAppointment(
          patientId!, doctorId, selectedDate!, dropdownValue!);
      Fluttertoast.showToast(
          msg: 'Вы были успешно записаны',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    print('object');
    setId();
    setState(() {
      dropdownValue = _doctors.doctors[0].specialty;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _datePicker() {
      return DateTimePicker(
        type: DateTimePickerType.dateTime,
        dateMask: 'd MMM, yyyy | hh:mm',
        initialValue: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        icon: Icon(Icons.event),
        dateLabelText: 'Date',
        timeLabelText: "Hour",
        selectableDayPredicate: (date) {
          // Disable weekend days to select from the calendar
          if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }

          return true;
        },
        onChanged: (val) => setState(() {
          selectedDate = val;
        }),
        onSaved: (val) => setState(() {
          selectedDate = val;
        }),
      );
    }

    return Center(
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 220, left: 10, right: 10),
              child: Column(
                children: [
                  Text(
                    'Запись ко врачу',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButton(
                    value: dropdownValue,
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        print(newValue);
                        dropdownValue = newValue!;
                      });
                    },
                    items: _doctors.doctors
                        .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                              child: Text(e.specialty),
                              value: e.specialty,
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  _datePicker(),
                  SizedBox(height: 20),
                  Button(
                    label: 'Записаться',
                    onPressed: appointment,
                  ),
                ],
              )),
          Padding(padding: EdgeInsets.only(top: 20, left: 10, right: 10)),
        ],
      ),
    );
  }
}
