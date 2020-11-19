import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  var _userAuth;
  var _username;
  bool _validate = false;

  Future<bool> _login(String uniqueKey) async {
    //just for debugging

    var searchedUserId = await _firestore
        .collection('Users')
        .where('password', isEqualTo: uniqueKey)
        .get();
    if (searchedUserId.size == 0) {
      print('can\'t find user id ');
    } else {
      var document = searchedUserId.docs.first;
      var userId = document.id;
      var user =
          await _firestore.collection('Users').doc(userId).get().then((user) {
        _username = user.get('username');
      }).catchError((e) {
        print('Failed to find username');
        _username = null;
        return false;
      });
    }
    return _auth
        .signInWithEmailAndPassword(email: _username, password: uniqueKey)
        .then((value) {
      print('${value.user.uid} has logined!');
      return true;
    }).catchError((e) {
      print('error: $e');
      return false;
    });
  }

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
              padding: const EdgeInsets.fromLTRB(50, 200, 50, 0),
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
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 150),
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
                        if (await _login(_controller.text)) {
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
