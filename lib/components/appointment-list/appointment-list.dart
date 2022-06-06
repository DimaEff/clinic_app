import 'package:clinic_app/domain/appointment.dart';
import 'package:clinic_app/services/appointment.dart';
import 'package:flutter/cupertino.dart';

import 'appointment-list-item.dart';

class AppointmentList extends StatefulWidget {
  AppointmentList({Key? key, required this.uid}) : super(key: key);

  String uid;
  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  AppointmentService _appointmentService = AppointmentService();

  List<Appointment> appos = [];
  getAppos() async {
    var ap = await _appointmentService.getAppoinments();
    setState(() {
      appos = ap;
    });
  }

  @override
  void initState() {
    print('object');
    getAppos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        child: ListView.builder(
          itemCount: appos.length,
          itemBuilder: (context, i) {
            return appos.isEmpty ? Text('Нет записей') : AppoListItem(appo: appos[i]);
          },
        ),
      ),
    );
  }
}
