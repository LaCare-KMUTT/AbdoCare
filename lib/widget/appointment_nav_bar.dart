import 'package:flutter/material.dart';

class AppointmentNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).primaryColor,
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  onPrimary: Colors.white,
                  primary: Color(0xFFC37447)),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('เลื่อนนัด', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              onPressed: () {
                showAlertDialog(context);
              },
            ),
          ],
        ),
      );
}

void showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        onPrimary: Colors.white,
        primary: Color(0xFFC37447)),
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text("ตกลง", style: TextStyle(fontSize: 16)),
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
