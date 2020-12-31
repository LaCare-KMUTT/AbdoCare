import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/interfaces/calculation_service_interface.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import './set_pin_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
  var _userId;
  var _userCollection;

  @override
  void initState() {
    super.initState();
    var userId = _firebaseService.getUserId();
    if (userId.isNotEmpty) {
      print('$userId is here');
    } else {
      print('$userId not found');
    }
    setState(() {
      _userId = userId;
      _userCollection = _firebaseService.getCollectionSnapshotByDocId(
          collection: 'Users', docId: _userId);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('ข้อมูลส่วนตัว'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: _userCollection,
            builder: (context, userCollection) {
              if (!userCollection.hasData) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Loading...'),
                    ],
                  ),
                );
              } else {
                return FutureBuilder<Map<String, dynamic>>(
                    future: _firebaseService.getLatestAnSubCollection(
                        userId: _userId),
                    builder: (context, anSubCollection) {
                      if (!anSubCollection.hasData) {
                        return Center(
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Text('Loading...'),
                            ],
                          ),
                        );
                      }
                      return ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'ชื่อ-นามสกุล',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(userCollection.data['name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'เพศ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(userCollection.data['gender'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'อายุ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        _calculationService
                                            .calculateAge(
                                                DateFormat('yyyy-mm-dd').parse(
                                                    userCollection.data['dob']))
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'วิธีการผ่าตัด',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        anSubCollection.data['operationMethod'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'เบอร์โทรศัพท์',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: userCollection
                                          .data['patientTel']
                                          .toString(),
                                      border: UnderlineInputBorder(),
                                      contentPadding: EdgeInsets.all(5.0),
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'น้ำหนัก',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: anSubCollection.data['weight']
                                          .toString(),
                                      border: UnderlineInputBorder(),
                                      contentPadding: EdgeInsets.all(5.0),
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  'ส่วนสูง',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintText: anSubCollection.data['height']
                                          .toString(),
                                      border: UnderlineInputBorder(),
                                      contentPadding: EdgeInsets.all(5.0),
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 10.0),
                                child: Text(
                                  '%BML',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 30.0, right: 30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                        _calculationService.calculateBMI(
                                          anSubCollection.data['weight'],
                                          anSubCollection.data['height'],
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  textColor: Colors.black,
                                  color: Color(0xFFEBEBEB),
                                  child: Text(
                                    'ตั้งค่ารหัสผ่านยืนยันตัวตน 6 หลัก',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  textColor: Colors.white,
                                  color: Color(0xFF2ED47A),
                                  child: Text(
                                    'ยืนยัน',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () {
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
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  textColor: Colors.white,
                                  color: Color(0xFFE96E4C),
                                  child: Text(
                                    'ออกจากระบบ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: () async {
                                    await _firebaseService.signout();
                                    Navigator.pushReplacementNamed(
                                        context, '/login_page');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              }
            }),
      );
}
