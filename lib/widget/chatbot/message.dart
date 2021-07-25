import 'package:flutter/material.dart';

class ShowMessage extends StatelessWidget {
  ShowMessage({this.text, this.name, this.type});

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(dynamic context) {
    return <Widget>[
      Container(
        child: CircleAvatar(
          child: Image.asset("assets/nurse.png"),
          backgroundColor: Colors.transparent,
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxWidth: 250),
                decoration: BoxDecoration(
                    color: Color(0xFFF1B43F),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> myMessage(dynamic context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxWidth: 250),
              decoration: BoxDecoration(
                  color: Color(0xFFFCECBC),
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 5.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/user.png"),
          backgroundColor: Colors.grey[300],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type ? myMessage(context) : otherMessage(context),
      ),
    );
  }
}
