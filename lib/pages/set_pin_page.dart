import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/firebase_service.dart';
import '../widget/pin/@enum/pin_mode.dart';
import '../widget/pin/pin_page.dart';

class SetPinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  final _firebaseService = FirebaseService();
  void _setPin({
    @required String strPin,
  }) {
    _firebaseService.updateFieldCollection(
        collection: 'Users',
        docId: _firebaseService.getUserId(),
        updateField: {'password': strPin});
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
