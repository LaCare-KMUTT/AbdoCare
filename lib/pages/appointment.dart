import 'package:flutter/material.dart';

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
        centerTitle: true,
        title: Text('ตารางนัด'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.pushNamed(context, '/chat_page');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
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

void showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
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
    actions: [
      okButton,
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
