import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './set_pin_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                    Text('นางสาวพรพิมล แก้วใส',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                    Text('หญิง', style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                    Text('22 ปี', style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                    Text('ผ่าตัดแบบส่องกล้อง',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                      hintText: 'xxx-xxx-xxxx',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                      hintText: '60',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                      hintText: '160',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
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
                      MaterialPageRoute(builder: (context) => SetPinPage()),
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
                    Navigator.pushReplacementNamed(context, '/chat_page');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
