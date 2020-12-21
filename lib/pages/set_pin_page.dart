import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widget/pin/@enum/pin_mode.dart';
import '../widget/pin/pin_page.dart';

class SetPinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  final uid = FirebaseAuth.instance.currentUser.uid;

  final _firestore = FirebaseFirestore.instance;

  void _setPin({
    @required String strPin,
  }) {
    _firestore
        .collection('Users')
        .doc(uid)
        .update({'password': strPin})
        .then((value) => {print('update success')})
        .catchError((onError) {
          print('error update password');
        });
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
          child: Pin(_setPin, PinMode.setPin),
        ),
      );
}
