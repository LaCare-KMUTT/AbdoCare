import 'dart:ui';

import 'package:flutter/material.dart';
import 'pain_form.dart';

class PostOpHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostOpHomeState();
}

class _PostOpHomeState extends State<PostOpHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แบบประเมิน'),
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
      body: Container(
        child: ListView(
          children: [
            //The evaluation form has not been done yet.
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
              child: RaisedButton(
                color: Color(0xFFE9E9E9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PainForm()),
                  );
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'แบบประเมินความปวดหลังการผ่าตัด',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Completed the evaluation form.
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 0),
                color: Color(0xFFF5F5F5),
                onPressed: () {},
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.done,
                              size: 40.0,
                              color: Colors.green,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'แบบประเมินแผล',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 0),
                color: Color(0xFFF5F5F5),
                onPressed: () {},
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.done,
                              size: 40.0,
                              color: Colors.green,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'แบบประเมินอาการแสดงที่ผิดปกติ',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
