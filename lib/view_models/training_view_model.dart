import 'package:flutter/material.dart';

import '../@enum/training_topic.dart';
import '../widget/training_information/post-op-home/daily_activity_advice.dart';
import '../widget/training_information/post-op-home/food_advice.dart';
import '../widget/training_information/post-op-home/infection_advice.dart';
import '../widget/training_information/post-op-home/pain_advice.dart';
import '../widget/training_information/post-op-home/surgical_incision_advice.dart';
import '../widget/training_information/post-op-hos-day0/drain_advice.dart';
import '../widget/training_information/post-op-hos-day0/pain_advice.dart';
import '../widget/training_information/post-op-hos-day0/respiratory_advice.dart';
import '../widget/training_information/post-op-hos-day1/blood_clots_advice.dart';
import '../widget/training_information/post-op-hos-day1/nutrition_advice.dart';
import '../widget/training_information/post-op-hos-day1/respiratory_advice.dart';
import '../widget/training_information/post-op-hos-day2-7/behave_advice.dart';
import '../widget/training_information/post-op-hos-day2-7/digestive_rehabilitation_advice.dart';
import '../widget/training_information/post-op-hos-day2-7/drain_secretion_advice.dart';
import '../widget/training_information/post-op-hos-day2-7/pain_advice_day2.dart';
import '../widget/training_information/post-op-hos-day2-7/pulmanary_rehabilitation_advice.dart';

class TrainingViewModel {
  List<Map<String, Object>> postOpHospital = [
    {
      "topic": "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
      "state": "post-op @ Hospital Day 0",
      "selectedtopic": TrainingTopic.respiratoryDay0,
    },
    {
      "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
      "state": "post-op @ Hospital Day 0",
      "selectedtopic": TrainingTopic.painDay01,
    },
    {
      "topic": "การจัดการแผลผ่าตัดและสายระบายต่างๆ",
      "state": "post-op @ Hospital Day 0",
      "selectedtopic": TrainingTopic.drainDay01,
    },
    {
      "topic": "การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
      "state": "post-op @ Hospital Day 1",
      "selectedtopic": TrainingTopic.respiratoryDay1,
    },
    {
      "topic": "การป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
      "state": "post-op @ Hospital Day 1",
      "selectedtopic": TrainingTopic.bloodclotDay1,
    },
    {
      "topic": "การจัดการภาวะโภชนาการ",
      "state": "post-op @ Hospital Day 1",
      "selectedtopic": TrainingTopic.nutritionDay1,
    },
    {
      "topic": "การจัดการความปวดขณะพักฟื้นอยู่ในโรงพยาบาล",
      "state": "post-op @ Hospital Day 2",
      "selectedtopic": TrainingTopic.painDay2,
    },
    {
      "topic": "การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
      "state": "post-op @ Hospital Day 2",
      "selectedtopic": TrainingTopic.infectionDay2,
    },
    {
      "topic": "การเฝ้าระวังความผิดปกติของการระบายสิ่งคัดหลั่ง",
      "state": "post-op @ Hospital Day 2",
      "selectedtopic": TrainingTopic.drainDay2,
    },
    {
      "topic": "การฟื้นฟูสมรรถภาพของปอด",
      "state": "post-op @ Hospital Day 2",
      "selectedtopic": TrainingTopic.pulmanaryDay2,
    },
    {
      "topic": "การฟื้นฟูระบบทางเดินอาหาร",
      "state": "post-op @ Hospital Day 2",
      "selectedtopic": TrainingTopic.digestiveDay2,
    },
    {
      "topic": "การแนะนำการปฏิบัติตัวที่เหมาะสมก่อนกลับบ้าน",
      "state": "post-op @ Hospital Day 2",
      "selectedtopic": TrainingTopic.behaveDay2,
    },
  ];

  List<Map<String, Object>> postOpHome = [
    {
      "topic": "การจัดการความปวดขณะพักฟื้นอยู่ที่บ้าน",
      "state": "post-op @ Home",
      "selectedtopic": TrainingTopic.painHome,
    },
    {
      "topic": "การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
      "state": "post-op @ Home",
      "selectedtopic": TrainingTopic.infectionHome,
    },
    {
      "topic": "การดูแลแผลผ่าตัด",
      "state": "post-op @ Home",
      "selectedtopic": TrainingTopic.surgicalIncisionHome,
    },
    {
      "topic": "การปฏิบัติกิจวัตรประจำวันหลังการผ่าตัด",
      "state": "post-op @ Home",
      "selectedtopic": TrainingTopic.dailyActivityHome,
    },
    {
      "topic": "การรับประทานอาหารที่เหมาะสม",
      "state": "post-op @ Home",
      "selectedtopic": TrainingTopic.foodHome,
    },
  ];
  TrainingViewModel();

  void navigateOnTopic(TrainingTopic selected, BuildContext context) {
    switch (selected) {
      case TrainingTopic.respiratoryDay0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RespiratoryAdviceDay0()));
        break;
      case TrainingTopic.painDay01:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainAdviceDay0()));
        break;
      case TrainingTopic.drainDay01:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DrainAdviceDay0()));
        break;
      case TrainingTopic.respiratoryDay1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RespiratoryAdviceDay1()));
        break;
      case TrainingTopic.bloodclotDay1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BloodclotsAdviceDay1()));
        break;
      case TrainingTopic.nutritionDay1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NutritionAdviceDay1()));
        break;
      case TrainingTopic.painDay2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainAdviceDay2()));
        break;
      case TrainingTopic.drainDay2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DrainSecretionAdviceDay2()));
        break;
      case TrainingTopic.pulmanaryDay2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PulmonaryAdviceDay2()));
        break;
      case TrainingTopic.digestiveDay2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DigestiveAdviceDay2()));
        break;
      case TrainingTopic.behaveDay2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BehaveAdviceDay2()));
        break;
      case TrainingTopic.painHome:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainAdvice()));
        break;
      case TrainingTopic.infectionHome:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InfectionAdvice()));
        break;
      case TrainingTopic.infectionDay2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => InfectionAdvice()));
        break;
      case TrainingTopic.surgicalIncisionHome:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SurgicalIncisionAdvice()));
        break;
      case TrainingTopic.dailyActivityHome:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DailyActivityAdvice()));
        break;
      case TrainingTopic.foodHome:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FoodAdvice()));
        break;
    }
  }
}
