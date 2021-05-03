import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/profile_model.dart';
import '../services/interfaces/calculation_service_interface.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import '../stores/user_store.dart';
import '../widget/shared/loading_widget.dart';
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
  final ProfileModel _profileModel = locator<ProfileModel>();
  String patientTel;
  int weight;
  int height;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('ข้อมูลส่วนตัว'),
        ),
        body: StreamBuilder<DocumentSnapshot>(
            stream: _profileModel.getUserProfileSnapshot(),
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
                    future: _profileModel.getAnProfileMap(),
                    builder: (context, anSubCollection) {
                      if (!anSubCollection.hasData) {
                        return loadingProgress;
                      }
                      return ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 20.0),
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
                                    left: 10.0, bottom: 0, top: 20.0),
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
                                    left: 10.0, bottom: 0, top: 20.0),
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
                                            .calculateAge(userCollection
                                                .data['dob']
                                                .toDate())
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, bottom: 0, top: 20.0),
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
                                    left: 10.0, bottom: 0, top: 20.0),
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
                                  initialValue:
                                      userCollection.data['patientTel'],
                                  onChanged: (value) {
                                    setState(() {
                                      patientTel = value;
                                    });
                                  },
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
                                  initialValue:
                                      anSubCollection.data['weight'].toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      weight = int.parse(value);
                                    });
                                  },
                                  onSaved: (value) => weight,
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
                                  initialValue:
                                      anSubCollection.data['height'].toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      height = int.parse(value);
                                    });
                                  },
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
                                    if (patientTel != null) {
                                      _firebaseService
                                          .updateDataToCollectionField(
                                              collection: 'Users',
                                              docId:
                                                  UserStore.getValueFromStore(
                                                      'storedUserId'),
                                              updateField: {
                                            'patientTel': patientTel,
                                          });
                                    }
                                    if (weight != null) {
                                      _firebaseService
                                          .updateFieldToSubCollection(
                                              collection: 'Users',
                                              docId:
                                                  UserStore.getValueFromStore(
                                                      'storedUserId'),
                                              subCollection: 'an',
                                              subCollectionDoc:
                                                  UserStore.getValueFromStore(
                                                      'storedLatestAnId'),
                                              data: {
                                            'weight': weight,
                                          });
                                    }
                                    if (height != null) {
                                      _firebaseService
                                          .updateFieldToSubCollection(
                                              collection: 'Users',
                                              docId:
                                                  UserStore.getValueFromStore(
                                                      'storedUserId'),
                                              subCollection: 'an',
                                              subCollectionDoc:
                                                  UserStore.getValueFromStore(
                                                      'storedLatestAnId'),
                                              data: {
                                            'height': height,
                                          });
                                    }
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
                                    await _firebaseService.signOut();
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
