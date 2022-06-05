import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.controller,
      this.obscure = false})
      : super(key: key);

  final Icon icon;
  final String hint;
  final TextEditingController controller;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: obscure,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 4,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black54,
              width: 2,
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconTheme(
              data: IconThemeData(color: Colors.black),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
