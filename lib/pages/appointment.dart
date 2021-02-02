import 'package:flutter/material.dart';
import '../widget/show_appointment.dart';

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
        children: <Widget>[
          Expanded(
            child: ShowAppointment(),
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
                children: <Widget>[
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
      children: <Widget>[
        Text("หากผู้ป่วยต้องการเลื่อนนัด",
            style: Theme.of(context).textTheme.bodyText2),
        Text("กรุณาติดต่อ\n", style: Theme.of(context).textTheme.bodyText2),
        Text("ในเวลาราชการ", style: Theme.of(context).textTheme.bodyText1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
          children: <Widget>[
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
