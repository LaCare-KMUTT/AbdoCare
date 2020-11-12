import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './set_pin_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  var _userId;
  // var _userData;
  @override
  void initState() {
    super.initState();
    var userId = FirebaseAuth.instance.currentUser.uid;
    if (userId.isNotEmpty) {
      print('$userId is here');
    } else {
      print('$userId not found');
    }
    // var userData =
    //     FirebaseFirestore.instance.collection('Users').doc(userId).get();
    setState(() {
      _userId = userId;
      // _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(_userId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading...'),
                  ],
                ),
              );
            } else {
              return ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'ชื่อ-นามสกุล',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data['name'],
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'เพศ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data['gender'],
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'อายุ',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data['dob'].toString(),
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'วิธีการผ่าตัด',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(snapshot.data['careTakerTel'],
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'เบอร์โทรศัพท์',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: snapshot.data['patientTel'].toString(),
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.all(5.0),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'น้ำหนัก',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: snapshot.data['weight'].toString(),
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.all(5.0),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'ส่วนสูง',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: snapshot.data['height'].toString(),
                              border: UnderlineInputBorder(),
                              contentPadding: EdgeInsets.all(5.0),
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                        child: Text(
                          'BMI ค่าดัชนีมวลกาย',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('23.44 (ท้วม)',
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        RaisedButton(
                          textColor: Colors.white,
                          color: Color(0xFFE38C14),
                          child: Text('ตั้งค่ารหัสผ่านยืนยันตัวตน 6 หลัก',
                              style: Theme.of(context).textTheme.bodyText1),
                          onPressed: () {
                            print('This is setpin button');
                            setState(() {});
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SetPinPage()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        RaisedButton(
                          textColor: Colors.white,
                          color: Color(0xFF33cc33),
                          child: Text('ยืนยัน',
                              style: Theme.of(context).textTheme.bodyText1),
                          onPressed: () {
                            print('This is setpin button');
                            setState(() {});
                            Navigator.pushReplacementNamed(
                                context, '/chat_page');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
