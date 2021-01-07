import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('AbdoCare'),
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
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 100),
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
                        if ((_validateHN && _validateHN) == false) {
                          if (await _firebaseService.login(
                              hn: _hnController.text,
                              uniqueKey: _uniqueKeycontroller.text)) {
                            print("login success!");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetPinPage()),
                            );
                          }
                        } else {
                          print('login failed');
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
