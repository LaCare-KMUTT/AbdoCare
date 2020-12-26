import 'dart:ui';

import 'package:flutter/material.dart';
import 'post-op-home_page.dart';

class SurgicalIncisionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SurgicalIncisionFormState();
  }
}

class _SurgicalIncisionFormState extends State<SurgicalIncisionForm> {
  var _value = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แผลผ่าตัด'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostOpHomePage()),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text('แสดงเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                    CheckboxListTile(
                      value: _value,
                      selected: _value,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _value2 = false;
                          _value3 = false;
                          _value4 = false;
                        });
                      },
                      title: Text('1. แผลผ่าตัดบวมมาก'),
                    ),
                    CheckboxListTile(
                      value: _value2,
                      selected: _value2,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value2 = value;
                          _value = false;
                          _value3 = false;
                          _value4 = false;
                        });
                      },
                      title: Text('2. มีหนองไหลจากแผลผ่าตัด'),
                    ),
                    CheckboxListTile(
                      value: _value3,
                      selected: _value3,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value3 = value;
                          _value = false;
                          _value2 = false;
                          _value4 = false;
                        });
                      },
                      title: Text('3. แผลผ่าตัดแห้งดี'),
                    ),
                    CheckboxListTile(
                      value: _value4,
                      selected: _value4,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value4 = value;
                          _value = false;
                          _value2 = false;
                          _value3 = false;
                        });
                      },
                      title: Text('4. ไม่ทราบ ต้องการให้พยาบาลประเมินแผล'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    child: Text('สำเร็จ',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    color: Color(0xFF2ED47A),
                    onPressed: () {
                      if (_value | _value2 == true) {
                        showAdvise1(context);
                      }
                      if (_value3 == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdvisePage()),
                        );
                      }
                      if (_value4 == true) {
                        showAdvise2(context);
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAdvise1(BuildContext context) {
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("แจ้งเตือน", style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ให้ผู้ป้วยมาพบแพทย์ทันที",
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostOpHomePage()),
            );
          },
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }

  void showAdvise2(BuildContext context) {
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ให้ผู้ป่วยส่งรูปแผลของตน",
              style: Theme.of(context).textTheme.bodyText2),
          Text("เพื่อให้พยาบาลประเมิน",
              style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("ส่งรูป", style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostOpHomePage()),
            );
          },
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}

//Show Advise information
class AdvisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("การดูแลแผล"),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            tooltip: 'กลับ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostOpHomePage()),
              );
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('คำแนะนำ'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                '1. ให้ผู้ป่วยจินตนาการในสถานที่ๆรู้สึกสบายเช่น ทะเล หรือภูเขา',
                                style: Theme.of(context).textTheme.bodyText1),
                            Text('2. ให้ผู้ป่วยทำกิจกรรมอื่นๆ',
                                style: Theme.of(context).textTheme.bodyText1),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('2.1 ดูโทรทัศน์ ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text('2.2 ฟังดนตรี',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text(
                                      '2.3 พูดคุยกับสมาชิกภายในบ้านหรือบุคคลอื่น',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                            ),
                            Text('3. การหายใจเป็นจังหวะสม่ำเสมอ',
                                style: Theme.of(context).textTheme.bodyText1),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                      '3.1 สูดลมหายใจเต็มปอดช้าๆ นับหนึ่งกลั้นไว้สักครู่ และ ค่อยๆหายใจออกช้าๆ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text(
                                      '3.2 ระหว่างนี้อาจทำสมาธิจากการมุ่งความสนใจที่ลมหายใจเข้า-ออก',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                            ),
                            Text('4. เกร็งและผ่อนคลายกล้ามเนื้อ',
                                style: Theme.of(context).textTheme.bodyText1),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                      '4.1 ฝึกเกร็งกล้ามเนื้อกลุ่มต่างๆให้ตึงตัวก่อน เช่น น่อง ต้นขา แผ่นหลัง หน้าท้อง สะโพก',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text(
                                      '4.2 จากนั้นเมื่อรู้สึกเกร็งนับ 1-3 แล้วคลายช้าๆ',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
