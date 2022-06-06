import 'package:clinic_app/domain/appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppoListItem extends StatelessWidget {
  const AppoListItem({Key? key, required this.appo}) : super(key: key);

  final Appointment appo;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(appo.start.substring(0, 16)),
            leading: Container(
              padding: EdgeInsets.symmetric(),
              child: Text(appo.specialty),
            ),
          ),
        )
    );
  }
}
