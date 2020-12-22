import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _firebaseService = FirebaseService();
  final _controller = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: _controller,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รหัสโค้ด',
                  errorText: _validate ? 'กรุณาใส่รหัสโค้ด 6 หลัก' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: TextField(
                //controller: _controller,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'หมายเลขผู้ป่วยนอก(HN)',
                  //errorText: _validate ? 'กรุณาใส่รหัสโค้ด 6 หลัก' : null,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 100),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xFF33cc33),
                    child: Text('ลงทะเบียน',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () async {
                      print('This is login button');
                      setState(() {
                        (_controller.text.isEmpty ||
                                _controller.text.length != 6)
                            ? _validate = true
                            : _validate = false;
                      });
                      if (_validate == false) {
                        if (await _firebaseService.login(_controller.text)) {
                          print("login success!");
                          Navigator.of(context)
                              .pushReplacementNamed('/profile_page');
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
}
