import 'package:flutter/material.dart';

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber({this.textEditingController, this.outlineInputBorder});

  @override
  Widget build(BuildContext context) => Container(
        width: 50.0,
        height: 100.0,
        child: TextField(
          controller: textEditingController,
          enabled: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white24,
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      );
}
