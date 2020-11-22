import 'package:flutter/material.dart';

import '../widget/pin/@enum/pin_mode.dart';
import '../widget/pin/pin_page.dart';

class PasscodePage extends StatefulWidget {
  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  void _getPin({
    @required String strPin,
  }) {
    print('dummy function _getPin');
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
