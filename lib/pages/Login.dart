import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final _controller = TextEditingController();
  var _userAuth;
  bool _validate = false;

  Future<bool> _login(String uniqueKey) async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseAuth.instance.signOut();
      print('Signout first ');
    }
    final searchedUserId = await FirebaseFirestore.instance
        .collection('Users')
        .where('password', isEqualTo: uniqueKey)
        .get();
    // print(searchedUserId.docs);
    // print(uniqueKey);
    if (searchedUserId.size == 0) {
      print('can\'t find user id ');
    } else {
      var document = searchedUserId.docs.first;
      final userId = document.id;
      final user = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .get();
      final username = user.get('username');
      print('This is username Login.dart');
      print(username);

      try {
        print('prepare to signin');
        var authResult = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: username, password: uniqueKey);
        setState(() {
          _userAuth = authResult;
        });
        print('passed signinFirebase');
        if (_userAuth.user.uid.isNotEmpty) {
          print('_authResult.user.uid.isNotEmpty');
          print('sign in! YEAH!');
          return true;
        }
        print(_userAuth.user.uid);
        print('end of try !');
      } on FirebaseAuthException catch (e) {
        print('catched here');
        if (e.code == 'user-not-found') {
          print('No user found for the email');
        } else if (e.code == 'wrong-password') {
          print('wrong password');
        }
        return false;
      }

      print('pass SIgn in !');
      // await FirebaseAuth.instance.signOut();
      // print('sign OUT ! ');
      //TODO DEVELOPER => pass user data to next page
    }
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
                        style: Theme.of(context).textTheme.bodyText1),
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
                          Navigator.pushReplacementNamed(
                              context, '/profile_page');
                        }
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
