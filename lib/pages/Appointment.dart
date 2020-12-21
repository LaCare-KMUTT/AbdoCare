import 'package:AbdoCare/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointPage extends StatefulWidget {
  AppointPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppointPageState();
}

class _AppointPageState extends State<AppointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตารางนัด'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'เพิ่มวันนัด',
            iconSize: 30,
            onPressed: () {
              addAppointPage(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return StuffInTiles(listOfTiles[index]);
              },
              itemCount: listOfTiles.length,
            ),
          ),
          FlatButton(
            padding: EdgeInsets.only(top: 0),
            textColor: Colors.white,
            onPressed: () {
              showAlertDialog(context);
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Color(0xFFC37447),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'เลื่อนนัด',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget OkButton = FlatButton(
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          "ตกลง",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("หากผู้ป่วยต้องการเลื่อนนัด",
            style: Theme.of(context).textTheme.bodyText2),
        Text("กรุณาติดต่อ\n", style: Theme.of(context).textTheme.bodyText2),
        // Text("ในเวลาราชการ 02-2565318",
        //     style: Theme.of(context).textTheme.bodyText1),
        // Text("นอกเวลาราชการ 02-2565172",
        //     style: Theme.of(context).textTheme.bodyText1),
        Text("ในเวลาราชการ", style: Theme.of(context).textTheme.bodyText1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              size: 30.0,
            ),
            Text(" 02-2565318", style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        Text("นอกเวลาราชการ", style: Theme.of(context).textTheme.bodyText1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.phone,
              size: 30.0,
            ),
            Text(" 02-2565172", style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ],
    ),
    // content: Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //   children: [
    //     Text("ในเวลาราชการ\n02-2565318\nนอกเวลาราชการ\n02-2565172"),
    //   ],
    // ),
    actions: [
      OkButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (context) => alert,
  );
}

class StuffInTiles extends StatelessWidget {
  final MyTile myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(MyTile t) {
    if (t.children.isEmpty) {
      return ListTile(
        title: Text(
          t.title,
        ),
      );
    }

    return ExpansionTile(
      key: PageStorageKey<int>(3),
      title: Text(
        t.title,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xFFC37447),
        ),
      ),
      children: t.children.map(_buildTiles).toList(),
    );
  }
}

class MyTile {
  String title;
  List<MyTile> children;
  MyTile(this.title, [this.children = const <MyTile>[]]);
}

List<MyTile> listOfTiles = <MyTile>[
  //Column
  MyTile(
    '19 กันยายน 2563',
    <MyTile>[
      MyTile('เจาะเลือด เวลา 09.00 น.'),
      MyTile('การเตรียมความพร้อมก่อนมาพบแพทย์: \nงดน้ำงดอาหารหลังสองทุ่ม'),
    ],
  ),
  //Column
  MyTile(
    '18 ตุลาคม 2563',
    <MyTile>[
      MyTile('นัดตรวจ เวลา 09.00 น.'),
      MyTile('การเตรียมความพร้อมก่อนมาพบแพทย์: \nไม่มี'),
    ],
  ),
];

void addAppointPage(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('เพิ่มวันนัด'),
          ),
          body: addappoint(),
        ),
      ));
}

class addappoint extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _addappointState();
  }
}

class _addappointState extends State<addappoint> {
  String pickedDate;
  String _date;
  DateTime selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay pickedTime;
  String _convertDateTimeDisplay(String date) {
    final displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final serverFormater = DateFormat('dd-MM-yyyy');
    final displayDate = displayFormater.parse(date);
    final formatted = serverFormater.format(displayDate);
    return formatted;
  }

  Future<Null> _selectTime(BuildContext context) async {
    TimeOfDay pickedTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (pickedTime != null && pickedTime != _time) {
      setState(() {
        _time = pickedTime;

        print(_time);
      });
    }
  }

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color(0xFFC37447),
            accentColor: const Color(0xFFC37447),
            colorScheme: ColorScheme.light(primary: const Color(0xFFC37447)),
          ),
          child: child,
        );
      },
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = _convertDateTimeDisplay(picked.toString());
        print(_date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.paste_rounded),
                            Text(
                              ' ชื่อหัวข้อ',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_today),
                            Text(
                              ' วัน/เดือน/ปี',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Text(
                            _date == null
                                ? "${selectedDate.toLocal()}".split(' ')[0]
                                : _date.toString(),
                            style: Theme.of(context).textTheme.bodyText1),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RaisedButton(
                            child: Text('เลือกวันนัด'),
                            onPressed: () {
                              _selectDate();
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            Text(
                              ' เวลา',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        Text(
                            _date == null
                                // ignore: lines_longer_than_80_chars
                                ? "${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')} น."
                                // ignore: lines_longer_than_80_chars
                                : "${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')} น.",
                            style: Theme.of(context).textTheme.bodyText1),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: RaisedButton(
                            child: Text('เลือกเวลา'),
                            onPressed: () {
                              _selectTime(context);
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.notes_rounded),
                            Text(
                              ' การเตรียมความพร้อม',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        TextFormField(
                          autofocus: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          onTap: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: RaisedButton(
                            color: Color(0xFF33cc33),
                            child: Text('บันทึก',
                                style: Theme.of(context).textTheme.bodyText1),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, '/appoint_page');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
