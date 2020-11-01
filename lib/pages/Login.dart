import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
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
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รหัสโค้ด',
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
                    onPressed: () {
                      print('This is login button');
                      setState(() {});
                      Navigator.pushReplacementNamed(context, '/profile_page');
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
