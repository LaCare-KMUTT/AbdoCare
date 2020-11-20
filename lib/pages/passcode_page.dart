import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/pin/@enum/pin_mode.dart';
import '../widget/pin/pin_page.dart';

class Passcode extends StatefulWidget {
  @override
  _PasscodeState createState() => _PasscodeState();
}

class _PasscodeState extends State<Passcode> {
  var _pin;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void _getPin({
    @required String strPin,
  }) {
    setState(() {
      _pin = strPin;
    });
  }

  Future<bool> _checkPin() async {
    var uid = _auth.currentUser.uid;
    var user = await _firestore.collection('Users').doc(uid).get();
    var passcode = user.get('password');
    if (passcode == _pin) {
      print('passcode : $passcode');
      return true;
    } else {
      print('wrong passcode : $_pin');
      print('correct is : $passcode');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC37447), Color(0xFFC37447)],
              begin: Alignment.bottomCenter,
            ),
          ),
          child: Pin(_getPin, PinMode.login),
        ),
      );
}
