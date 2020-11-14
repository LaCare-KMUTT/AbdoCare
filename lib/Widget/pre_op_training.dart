import 'package:flutter/material.dart';

class PreOpTrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PreOpTrainingPageState();
  }
}

class _PreOpTrainingPageState extends State<PreOpTrainingPage> {
  int number;
  String topic;
  String detail;
  void detailpage(int number, String topic, String detail) {
    if (number == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => pushToScreen(context, topic, detail)),
      );
    } else if (number == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => pushToScreen(context, topic, detail)),
      );
    } else if (number == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => pushToScreen(context, topic, detail)),
      );
    } else if (number == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => pushToScreen(context, topic, detail)),
      );
    }
  }

  pushToScreen(BuildContext context, String topic, String detail) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic),
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

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        'topic': "การเตรียมตัวก่อนผ่าตัด",
        "id": 0,
        "detail":
            "ในช่วง 1 วันก่อนผ่าตัดจะมีการงดน้ำงดอาหาร และจะมีการสวนก้นเพื่อให้ขับถ่ายของเสีย"
      },
      {
        'topic': "การปฎิบัติตัวหลังการผ่าตัด",
        "id": 1,
        "detail": "พยายามลุกเดิน"
      },
      {
        'topic': "อาหารที่ควรรับประทาน",
        "id": 2,
        "detail": "หลีกเลี่ยงอาหารประเภททอด"
      }
    ];
    var anotherlist = [
      {
        'topic': "การใช้ห้องน้ำ",
        "id": 0,
        "detail":
            "ผู้ป่วยสามารถอาบน้ำได้เนื่องจากทางโรงพยาบาลได้ปิดแผลแบบกันน้ำ"
      },
      {
        'topic': "อาหารที่ควรรับประทานหลังผ่าตัด",
        "id": 1,
        "detail": "หลีกเลี่ยงอาหารประเภททอด"
      }
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
                        detailpage(number, topic, detail);
                        pushToScreen(context, topic, detail);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(item['topic'],
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Icon(
                            Icons.navigate_next,
                            size: 32,
                          ),
                        ],
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
                        detailpage(number, topic, detail);
                        pushToScreen(context, topic, detail);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(item['topic'],
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Icon(
                            Icons.navigate_next,
                            size: 32,
                          ),
                        ],
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
}
