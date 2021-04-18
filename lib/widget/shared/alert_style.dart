import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AlertStyle alertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.center,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    side: BorderSide(
      color: Colors.grey[50],
    ),
  ),
  titleStyle: TextStyle(
    color: Color(0xFFC37447),
  ),
  alertAlignment: Alignment.center,
);

class Dialogs {
  static Future<void> alertDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("กรุณาทำแบบประเมินให้ครบถ้วน",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center),
            actions: [
              FlatButton(
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
                  Navigator.pop(context);
                },
              )
            ]);
      },
    );
  }
}
