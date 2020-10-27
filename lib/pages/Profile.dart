import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePage();
  }
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC37447),
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  'ชื่อ-นามสกุล',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'ตัวอย่าง: นางสาวกรรไกร ไข่ผ้าไหม',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'เพศ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'หญิง',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'อายุ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '50',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'วิธีการผ่าตัด',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ผ่าตัดแบบส่องกล้อง', style: TextStyle(fontSize: 18)),
                  ],
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'เบอร์โทรศัพท์',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'xxx-xxx-xxxx',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'น้ำหนัก',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '60',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'ส่วนสูง',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '160',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
              Container(
                child: Text(
                  'BMI ค่าดัชนีมวลกาย',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
                margin: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('23.44 (ท้วม)', style: TextStyle(fontSize: 18)),
                  ],
                ),
                margin: EdgeInsets.only(left: 30.0, right: 30.0),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xFFE38C14),
                  child: Text('ตั้งค่ารหัสผ่านยืนยันตัวตน 6 หลัก',
                      style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    print('This is login button');
                    setState(() {});
                    Navigator.pushNamed(context, '/login_page');
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
