import 'package:flutter/material.dart';

import '../@enum/pin_mode.dart';
import '../services/service_locator.dart';
import '../view_models/pin_view_model.dart';
import '../widget/pin/pin.dart';

class SetPinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetPinPageState();
}

class _SetPinPageState extends State<SetPinPage> {
  final PinViewModel _pinViewModel = locator<PinViewModel>();
  void _setPin({
    @required String strPin,
  }) {
    _pinViewModel.setPin(strPin: strPin);
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
