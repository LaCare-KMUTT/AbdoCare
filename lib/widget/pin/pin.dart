import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../services/service_locator.dart';
import '../../view_models/pin_view_model.dart';
import '../shared/alert_style.dart';
import '@enum/pin_mode.dart';
import 'keyboard_number.dart';
import 'pin_number.dart';

class Pin extends StatefulWidget {
  final PinMode mode;

  Pin(this.getPin, this.mode);

  final void Function({
    @required String strPin,
  }) getPin;

  @override
  State<StatefulWidget> createState() => _PinState();
}

class _PinState extends State<Pin> {
  final _pinViewModel = locator<PinViewModel>();

  List<String> currentPin = ["", "", "", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Color(0xFFC37447),
    ),
  );
  int pinIndex = 0;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment(0, 0.5),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildSecurityText(),
                    SizedBox(height: 40.0),
                    buildPinRow(),
                  ],
                ),
              ),
            ),
            buildNumberPad(),
          ],
        ),
      );

  Widget buildNumberPad() => Expanded(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      number: 1,
                      onPressed: () {
                        pinIndexSetup("1");
                      },
                    ),
                    KeyboardNumber(
                      number: 2,
                      onPressed: () {
                        pinIndexSetup("2");
                      },
                    ),
                    KeyboardNumber(
                      number: 3,
                      onPressed: () {
                        pinIndexSetup("3");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      number: 4,
                      onPressed: () {
                        pinIndexSetup("4");
                      },
                    ),
                    KeyboardNumber(
                      number: 5,
                      onPressed: () {
                        pinIndexSetup("5");
                      },
                    ),
                    KeyboardNumber(
                      number: 6,
                      onPressed: () {
                        pinIndexSetup("6");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      number: 7,
                      onPressed: () {
                        pinIndexSetup("7");
                      },
                    ),
                    KeyboardNumber(
                      number: 8,
                      onPressed: () {
                        pinIndexSetup("8");
                      },
                    ),
                    KeyboardNumber(
                      number: 9,
                      onPressed: () {
                        pinIndexSetup("9");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: null,
                        child: SizedBox(),
                      ),
                    ),
                    KeyboardNumber(
                      number: 0,
                      onPressed: () {
                        pinIndexSetup("0");
                      },
                    ),
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        height: 60.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        onPressed: () {
                          clearPin();
                        },
                        child:
                            Icon(Icons.backspace_outlined, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  void clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  void pinIndexSetup(String text) async {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    var strPin = "";
    // ignore: avoid_function_literals_in_foreach_calls
    currentPin.forEach((element) {
      strPin += element;
    });
    if (pinIndex == 6) {
      if (widget.mode == PinMode.setPin) {
        Alert(
          context: context,
          type: AlertType.warning,
          title: "ยืนยันรหัสผ่าน",
          buttons: [
            DialogButton(
              child: Text(
                "ยกเลิก",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                clearPin();
                Navigator.pop(context);
              },
              color: Color.fromRGBO(255, 49, 0, 1.0),
            ),
            DialogButton(
              child: Text(
                "ยืนยัน",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                widget.getPin(strPin: strPin);
                Navigator.pushReplacementNamed(context, '/profile_page');
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            )
          ],
        ).show();
      } else if (widget.mode == PinMode.login) {
        var isCheckPin = await _pinViewModel.checkPin(strPin);
        print('isCheckpin =  $isCheckPin');
        if (isCheckPin != null) {
          print('isCheckpin after check null =  $isCheckPin');
          if (isCheckPin == true) {
            CircularProgressIndicator();
            Navigator.pushReplacementNamed(context, '/chat_page');
          } else {
            _showErrorSignInDialog();
          }
        }
      }
    }
  }

  void _showErrorSignInDialog() {
    Alert(
      context: context,
      type: AlertType.warning,
      style: alertStyle,
      title: "ขออภัยค่ะ",
      content: Text(
        'ท่านกรอกรหัส PIN ไม่ถูกต้อง กรุณาตรวจสอบและลองใหม่อีกครั้งค่ะ',
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xFFC37447),
        ),
      ],
    ).show();
  }

  void setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }

  Widget buildPinRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinOneController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinTwoController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinThreeController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFourController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFiveController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinSixController,
          ),
        ],
      );

  Widget buildSecurityText() => Text(
        widget.mode == PinMode.setPin
            ? 'ตั้งค่ารหัสผ่านใหม่'
            : 'กรุณากรอกรหัส PIN',
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      );
}
