import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(9, 49, 112, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: TextStyle(
            fontSize: 20.0,
          )
        ),
      ),
    );
  }
}
