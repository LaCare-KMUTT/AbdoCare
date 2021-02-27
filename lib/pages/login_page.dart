import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../services/format_text.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import 'set_pin_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final _uniqueKeycontroller = TextEditingController();
  final _hnController = TextEditingController();
  bool _validateHN = false;
  bool _validateUniqueKey = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AbdoCare',
        ),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
              child: TextField(
                controller: _hnController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'หมายเลขผู้ป่วยนอก(HN)',
                  errorText:
                      _validateHN ? 'กรุณาใส่หมายเลขผู้ป่วยนอก(HN)' : null,
                ),
                inputFormatters: [UpperCaseText()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: TextField(
                controller: _uniqueKeycontroller,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รหัสโค้ด',
                  errorText:
                      _validateUniqueKey ? 'กรุณาใส่รหัสโค้ด 6 หลัก' : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, screenSize.height / 4),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    color: Color(0xFF2ED47A),
                    child: Text('ลงทะเบียน',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () async {
                      setState(() {
                        _uniqueKeycontroller.text.isEmpty ||
                                _uniqueKeycontroller.text.length != 6
                            ? _validateUniqueKey = true
                            : _validateUniqueKey = false;

                        _hnController.text.isEmpty ||
                                _hnController.text.length !=
                                    7 // TODO Define HN length.
                            ? _validateHN = true
                            : _validateHN = false;
                      });
                      if (_validateHN == false && _validateUniqueKey == false) {
                        if (await _firebaseService.signIn(
                            hn: _hnController.text.trim(),
                            uniqueKey: _uniqueKeycontroller.text.trim())) {
                          print("login success!");
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SetPinPage()),
                          );
                        }
                      } else {
                        print('login failed');
                        _showErrorSignInDialog(context);
                      }
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Hospital_logo.png',
                      height: 100,
                      width: 80,
                    ),
                    Image.asset(
                      'assets/STIN_logo.png',
                      height: 100,
                      width: 80,
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showErrorSignInDialog(BuildContext context) {
  var alertStyle = AlertStyle(
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
  Alert(
    context: context,
    type: AlertType.warning,
    style: alertStyle,
    title: "ขออภัยค่ะ",
    content: Text(
      'ไม่สามารถลงทะเบียนได้เนื่องจากท่านกรอกข้อมูลไม่ถูกต้องค่ะ',
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
