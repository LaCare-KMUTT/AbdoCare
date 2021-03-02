import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AlertStyle alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    side: BorderSide(
      color: Colors.grey[50],
    ),
  ),
  titleStyle: TextStyle(
    color: Color(0xFFC37447),
  ),
  alertAlignment: Alignment.center,
);
