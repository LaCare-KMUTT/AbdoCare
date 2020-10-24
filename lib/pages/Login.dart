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
        backgroundColor: Color(0xFFC37447),
        title: Text('AbdoCare'),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                //ใส่ขนาดว่าจะเป็นขนาดไหน
                style: Theme.of(context).textTheme.bodyText1,
                //ทำให้textไปตรงกลางของช่อง
                textAlign: TextAlign.center,
                //ใส่ว่าช่องนี้จะใส่อะไรเป็นข้อความแนะนำ
                decoration: InputDecoration(labelText: 'รหัสโค้ด'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
