import 'package:flutter/material.dart';

import '../../pages/chat_page.dart';
import '@enum/topic_mode.dart';
import 'post-op-home/daily_activity_advice.dart';
import 'post-op-home/food_advice.dart';
import 'post-op-home/infection_advice.dart';
import 'post-op-home/pain_advice.dart';
import 'post-op-home/surgical_incision_advice.dart';
import 'post-op-hos-day0/drain_advice.dart';
import 'post-op-hos-day0/pain_advice.dart';
import 'post-op-hos-day0/respiratory_advice.dart';
import 'post-op-hos-day1/blood_clots_advice.dart';
import 'post-op-hos-day1/nutrition_advice.dart';
import 'post-op-hos-day1/respiratory_advice.dart';
import 'post-op-hos-day2-7/behave_advice.dart';
import 'post-op-hos-day2-7/digestive_rehabilitation_advice.dart';
import 'post-op-hos-day2-7/drain_secretion_advice.dart';
import 'post-op-hos-day2-7/pain_advice_day2.dart';
import 'post-op-hos-day2-7/pulmanary_rehabilitation_advice.dart';

class PostOpHomeTrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostOpHomeTrainingPageState();
}

class _PostOpHomeTrainingPageState extends State<PostOpHomeTrainingPage> {
  int number;
  String topic;
  String state;
  TopicMode selectedtopic;
  void detailpage(TopicMode selected) {
    if (selected == TopicMode.respiratoryDay0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RespiratoryAdviceDay0()));
    } else if (selected == TopicMode.painDay0 ||
        selected == TopicMode.painDay1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PainAdviceDay0()));
    } else if (selected == TopicMode.drainDay0 ||
        selected == TopicMode.drainDay0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DrainAdviceDay0()));
    } else if (selected == TopicMode.respiratoryDay1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => RespiratoryAdviceDay1()));
    } else if (selected == TopicMode.bloodclotDay1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => BloodclotsAdviceDay1()));
    } else if (selected == TopicMode.nutritionDay1) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NutritionAdviceDay1()));
    } else if (selected == TopicMode.painDay2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PainAdviceDay2()));
    } else if (selected == TopicMode.drainDay2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DrainSecretionAdviceDay2()));
    } else if (selected == TopicMode.pulmanaryDay2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PulmonaryAdviceDay2()));
    } else if (selected == TopicMode.digestiveDay2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DigestiveAdviceDay2()));
    } else if (selected == TopicMode.behaveDay2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BehaveAdviceDay2()));
    } else if (selected == TopicMode.painHome) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PainAdvice()));
    } else if (selected == TopicMode.infectionHome ||
        selected == TopicMode.infectionDay2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InfectionAdvice()));
    } else if (selected == TopicMode.surgicalIncisionHome) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SurgicalIncisionAdvice()));
    } else if (selected == TopicMode.dailyActivityHome) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DailyActivityAdvice()));
    } else if (selected == TopicMode.foodHome) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FoodAdvice()));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> anotherlist = [
      {
        "topic": "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
        "state": "post-op @ Hospital Day 0",
        "selectedtopic": TopicMode.respiratoryDay0,
      },
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
        "state": "post-op @ Hospital Day 0",
        "selectedtopic": TopicMode.painDay0,
      },
      {
        "topic": "การจัดการแผลผ่าตัดและสายระบายต่างๆ",
        "state": "post-op @ Hospital Day 0",
        "selectedtopic": TopicMode.drainDay0,
      },
      {
        "topic": "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
        "state": "post-op @ Hospital Day 1",
        "selectedtopic": TopicMode.respiratoryDay1,
      },
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
        "state": "post-op @ Hospital Day 1",
        "selectedtopic": TopicMode.painDay1,
      },
      {
        "topic": "การจัดการแผลผ่าตัดและสายระบายต่างๆ",
        "state": "post-op @ Hospital Day 1",
        "selectedtopic": TopicMode.drainDay1,
      },
      {
        "topic": "การป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
        "state": "post-op @ Hospital Day 1",
        "selectedtopic": TopicMode.bloodclotDay1,
      },
      {
        "topic": "การจัดการภาวะโภชนาการ",
        "state": "post-op @ Hospital Day 1",
        "selectedtopic": TopicMode.nutritionDay1,
      },
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
        "state": "post-op @ Hospital Day 2",
        "selectedtopic": TopicMode.painDay2,
      },
      {
        "topic": "การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
        "state": "post-op @ Hospital Day 2",
        "selectedtopic": TopicMode.infectionDay2,
      },
      {
        "topic": "การเฝ้าระวังความผิดปกติของการระบายสิ่งคัดหลั่ง",
        "state": "post-op @ Hospital Day 2",
        "selectedtopic": TopicMode.drainDay2,
      },
      {
        "topic": "การฟื้นฟูสมรรถภาพของปอด",
        "state": "post-op @ Hospital Day 2",
        "selectedtopic": TopicMode.pulmanaryDay2,
      },
      {
        "topic": "การฟื้นฟูระบบทางเดินอาหาร",
        "state": "post-op @ Hospital Day 2",
        "selectedtopic": TopicMode.digestiveDay2,
      },
      {
        "topic": "การแนะนำการปฏิบัติตัวที่เหมาะสมก่อนกลับบ้าน",
        "state": "post-op @ Hospital Day 2",
        "selectedtopic": TopicMode.behaveDay2,
      },
    ];

    var postOpHome = [
      {
        "topic": "การจัดการความปวดขณะพักฟื้นอยู่ที่บ้าน",
        "state": "post-op @ Home",
        "selectedtopic": TopicMode.painHome,
      },
      {
        "topic": "การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
        "state": "post-op @ Home",
        "selectedtopic": TopicMode.infectionHome,
      },
      {
        "topic": "การดูแลแผลผ่าตัด",
        "state": "post-op @ Home",
        "selectedtopic": TopicMode.surgicalIncisionHome,
      },
      {
        "topic": "การปฏิบัติกิจวัตรประจำวันหลังการผ่าตัด",
        "state": "post-op @ Home",
        "selectedtopic": TopicMode.dailyActivityHome,
      },
      {
        "topic": "การรับประทานอาหารที่เหมาะสม",
        "state": "post-op @ Home",
        "selectedtopic": TopicMode.foodHome,
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
                        selectedtopic = item['selectedtopic'];
                        detailpage(selectedtopic);
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
                        selectedtopic = item['selectedtopic'];
                        detailpage(selectedtopic);
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
