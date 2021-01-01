import 'package:flutter/material.dart';

class PostOpHomeTrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostOpHomeTrainingPageState();
}

class _PostOpHomeTrainingPageState extends State<PostOpHomeTrainingPage> {
  int number;
  String topic;
  String detail;
  @override
  Widget build(BuildContext context) {
    var list = [
      {
        'topic': "การจัดการความปวด",
        "id": 0,
        "detail": "...................................0"
      },
      {
        'topic': "การดูแลแผลผ่าตัด",
        "id": 1,
        "detail": "...................................1"
      },
      {
        'topic': "การปฏิบัติกิจวัตรประจำวันหลังการผ่าตัด",
        "id": 2,
        "detail": "...................................2"
      },
      {
        'topic': "การรับประทานอาหารที่เหมาะสม",
        "id": 3,
        "detail": "...................................3"
      },
    ];
    var anotherlist = [
      {
        'topic': "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
        "id": 0,
        "detail": "...................................0"
      },
      {
        'topic': "การจัดการแผลผ่าตัดและสายระบายต่างๆ",
        "id": 1,
        "detail": "...................................1"
      },
      {
        'topic': "การป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
        "id": 2,
        "detail": "...................................2"
      },
      {
        'topic': "การจัดการภาวะโภชนาการ",
        "id": 3,
        "detail": "...................................3"
      },
      {
        'topic': "การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
        "id": 4,
        "detail": "...................................4"
      },
      {
        'topic': "การเฝ้าระวังความผิดปกติของการระบายสิ่งคัดหลั่ง",
        "id": 5,
        "detail": "...................................5"
      },
      {
        'topic': "การฟื้นฟูสมรรถภาพของปอด",
        "id": 6,
        "detail": "...................................6"
      },
      {
        'topic': "การฟื้นฟูสมรรถภาพของปอด",
        "id": 7,
        "detail": "...................................7"
      },
      {
        'topic': "การฟื้นฟูระบบทางเดินอาหาร",
        "id": 8,
        "detail": "...................................8"
      },
      {
        'topic': "การแนะนำการปฏิบัติตัวที่เหมาะสมก่อนกลับบ้าน",
        "id": 9,
        "detail": "...................................9"
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('การฝึกสอนและอบรม'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('คำแนะนำที่ควรทราบ'),
            ),
            Column(
              children: [
                for (var item in list)
                  Card(
                    child: FlatButton(
                      onPressed: () {
                        number = item['id'];
                        topic = item['topic'];
                        detail = item['detail'];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    pushToScreen(context, topic, detail)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(item['topic'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('คำแนะนำอื่นๆ'),
            ),
            Column(
              children: [
                for (var item in anotherlist)
                  Card(
                    child: FlatButton(
                      onPressed: () {
                        number = item['id'];
                        topic = item['topic'];
                        detail = item['detail'];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    pushToScreen(context, topic, detail)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(item['topic'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 32,
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

  Widget pushToScreen(BuildContext context, String topic, String detail) =>
      Scaffold(
        appBar: AppBar(
          title: Text("คำแนะนำ"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              detail,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      );
}
