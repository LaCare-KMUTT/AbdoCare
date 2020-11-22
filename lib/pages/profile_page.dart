import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './set_pin_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  var _userId;
  var _age;
  final _auth = FirebaseAuth.instance;
  // var _userData;

  Future<bool> _signout() async {
    if (_auth.currentUser != null) {
      await FirebaseAuth.instance.signOut();
      print('Signout first ');
    }
  }

  String calculateBMI(int weight, int height) {
    var heightMeter = height / 100;
    var bmi = (weight) / (heightMeter * heightMeter);
    return bmi.toStringAsFixed(2);
  }

  int calculateAge(DateTime birthDate) {
    var currentDate = DateTime.now();
    var age = currentDate.year - birthDate.year;
    var month1 = currentDate.month;
    var month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      var day1 = currentDate.day;
      var day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

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
                            Text(
                                calculateAge(DateFormat('mm-dd-yyyy')
                                        .parse(snapshot.data['dob']))
                                    .toString(),
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
                            Text(
                                calculateBMI(
                                  snapshot.data['weight'],
                                  snapshot.data['height'],
                                ),
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
                          child: Text(
                            'ตั้งค่ารหัสผ่านยืนยันตัวตน 6 หลัก',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            print('This is setpin button');
                            // setState(() {});
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        RaisedButton(
                          textColor: Colors.white,
                          color: Color(0xFF33cc33),
                          child: Text(
                            'ยืนยัน',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            print('This is setpin button');
                            Navigator.pushReplacementNamed(
                                context, '/chat_page');
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
                          color: Colors.red,
                          child: Text(
                            'ออกจากระบบ',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () async {
                            await _signout();
                            Navigator.pushReplacementNamed(
                                context, '/login_page');
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
