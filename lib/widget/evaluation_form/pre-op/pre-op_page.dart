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
        title: Text('แบบประเมินพัฒนาการของผู้ป่วย'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 20),
              child: RaisedButton(
                padding: EdgeInsets.only(top: 0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ADLForm()),
                  );
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.done,
                            size: 40.0,
                            color: Colors.green,
                          ),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'แบบประเมินการปฏิบัติกิจวัตรประจำวันก่อนผ่าตัด ',
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
