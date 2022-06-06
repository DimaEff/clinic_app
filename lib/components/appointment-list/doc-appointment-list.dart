import 'package:clinic_app/domain/appointment.dart';
import 'package:clinic_app/services/appointment.dart';
import 'package:flutter/cupertino.dart';

import 'appointment-list-item.dart';

class DocAppointmentList extends StatefulWidget {
  DocAppointmentList({Key? key, required this.spec}) : super(key: key);

  String spec;
  @override
  State<DocAppointmentList> createState() => _DocAppointmentList();
}

class _DocAppointmentList extends State<DocAppointmentList> {
  AppointmentService _appointmentService = AppointmentService();

  List<Appointment> appos = [];
  getAppos() async {
    var ap = await _appointmentService.getAppoinments();
    setState(() {
      appos = ap.where((element) => element.specialty == widget.spec).toList();
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
