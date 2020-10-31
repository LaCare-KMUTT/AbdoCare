import 'package:flutter/material.dart';

class RichMenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RichMenuPageState();
}

class _RichMenuPageState extends State<RichMenuPage> {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[900].withOpacity(0.62),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.orange,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'เมนูหลัก',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFFC37447),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.only(top: 0),
                onPressed: () {},
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Color(0xFFFCECBC),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'แบบประเมิน',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FlatButton(
                      color: Color(0xFFF8CC77),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'สรุปผลประจำวัน',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Color(0xFFF1B43F),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ตารางนัด',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Color(0xFFE38C14),
                      onPressed: () {},
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'การฝึกสอน',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
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
