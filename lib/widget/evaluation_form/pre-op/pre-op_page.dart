import 'dart:ui';

import 'package:flutter/material.dart';
import 'adl_form.dart';

class PreOpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PreOpPageState();
}

class _PreOpPageState extends State<PreOpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แบบประเมิน'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
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
                color: Colors.white10,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ADLForm()),
                  );
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'แบบประเมินการปฏิบัติกิจวัตรประจำวันก่อนผ่าตัด',
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
                color: Colors.white70,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ADLForm()),
                  );
                },
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
                                    'แบบประเมินการปฏิบัติกิจวัตรประจำวันก่อนผ่าตัด',
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
