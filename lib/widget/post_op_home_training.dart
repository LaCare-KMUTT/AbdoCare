import 'package:flutter/material.dart';
import '../pages/chat_page.dart';
import 'training_information/post-op-home/daily_activity_advice.dart';
import 'training_information/post-op-home/food_advice.dart';
import 'training_information/post-op-home/pain_advice.dart';
import 'training_information/post-op-home/surgical_incision_advice.dart';
import 'training_information/post-op-hos-day0/respiratory_advice.dart';

class PostOpHomeTrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostOpHomeTrainingPageState();
}

class _PostOpHomeTrainingPageState extends State<PostOpHomeTrainingPage> {
  int number;
  String topic;
  String state;
  void detailpage(int number) {
    if (number == 1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RespiratoryAdvice()));
    } else if (number == 15) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PainAdvice()));
    } else if (number == 16) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SurgicalIncisionAdvice()));
    } else if (number == 17) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DailyActivityAdvice()));
    } else if (number == 18) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FoodAdvice()));
    }
  }

  @override
  Widget build(BuildContext context) {
    var anotherlist = [
      {
        "topic": "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
        "state": "post-op @ Hospital Day 0",
        "id": 1,
      },
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
        "state": "post-op @ Hospital Day 0",
        "id": 2,
      },
      {
        "topic": "การจัดการแผลผ่าตัดและสายระบายต่างๆ",
        "state": "post-op @ Hospital Day 0",
        "id": 3,
      },
      {
        "topic": "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
        "state": "post-op @ Hospital Day 1",
        "id": 4,
      },
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
        "state": "post-op @ Hospital Day 1",
        "id": 5,
      },
      {
        "topic": "การจัดการแผลผ่าตัดและสายระบายต่างๆ",
        "state": "post-op @ Hospital Day 1",
        "id": 6,
      },
      {
        "topic": "การป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
        "state": "post-op @ Hospital Day 1",
        "id": 7,
      },
      {
        "topic": "การจัดการภาวะโภชนาการ",
        "state": "post-op @ Hospital Day 1",
        "id": 8,
      },
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
        "state": "post-op @ Hospital Day 2",
        "id": 9,
      },
      {
        "topic": "การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
        "state": "post-op @ Hospital Day 2",
        "id": 10,
      },
      {
        "topic": "การเฝ้าระวังความผิดปกติของการระบายสิ่งคัดหลั่ง",
        "state": "post-op @ Hospital Day 2",
        "id": 11,
      },
      {
        "topic": "การฟื้นฟูสมรรถภาพของปอด",
        "state": "post-op @ Hospital Day 2",
        "id": 12,
      },
      {
        "topic": "การฟื้นฟูระบบทางเดินอาหาร",
        "state": "post-op @ Hospital Day 2",
        "id": 13,
      },
      {
        "topic": "การแนะนำการปฏิบัติตัวที่เหมาะสมก่อนกลับบ้าน",
        "state": "post-op @ Hospital Day 2",
        "id": 14,
      },
    ];

    var postOpHome = [
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ที่บ้าน",
        "state": "post-op @ Home",
        "id": 15,
      },
      {
        "topic": "การดูแลแผลผ่าตัด",
        "state": "post-op @ Home",
        "id": 16,
      },
      {
        "topic": "การปฏิบัติกิจวัตรประจำวันหลังการผ่าตัด",
        "state": "post-op @ Home",
        "id": 17,
      },
      {
        "topic": "การรับประทานอาหารที่เหมาะสม",
        "state": "post-op @ Home",
        "id": 18,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('การฝึกสอนและอบรม'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          },
        ),
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
                for (var item in postOpHome)
                  Card(
                    child: FlatButton(
                      onPressed: () {
                        number = item['id'];
                        topic = item['topic'];
                        detailpage(number);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) =>
                        //           TrainingInformation(numberid: number),
                        //       //pushToScreen(context, number),
                        //     ));
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
                        detailpage(number);
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

  Widget pushToScreen(BuildContext context, int number) => Scaffold(
        appBar: AppBar(
          title: Text("คำแนะนำ"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Detail",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ),
      );
}
