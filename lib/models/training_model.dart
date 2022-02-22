import '../@enum/training_topic.dart';

class TrainingModel {
  Map<String, String> trainingLink = {
    "DailyActivityAdvice": "https://youtu.be/APUgLilx37A",
    "FoodAdvice": "https://youtu.be/i51FDKRcKVc",
    "InfectionAdvice": "https://youtu.be/IS8EkDcadDk",
    "SurgicalIncisionAdvice": "https://youtu.be/sXxHrKrE8HI",
    "RespiratoryAdviceDay0": "https://youtu.be/ih-dgzAsAdg",
    "BloodclotsAdviceDay1": "https://youtu.be/hCpHl0A_6TE",
    "NutritionAdviceDay1": "https://youtu.be/hn8kQaT-qe8",
    "RespiratoryAdviceDay1": "https://youtu.be/5Vw4KJrLqTo",
    "BehaveAdviceDay2": "https://youtu.be/3jVL62y8fp4",
    "DigestiveAdviceDay2": "https://youtu.be/MB7NVIb-bck",
    "PulmonaryAdviceDay2": "https://youtu.be/fgKkGjSHISg",
  };
  List<Map<String, Object>> postOpHosDay0List = [
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
  ];
  List<Map<String, Object>> postOpHosDay1List = [
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
  ];
  List<Map<String, Object>> postOpHosDay2List = [
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
  List<Map<String, Object>> postOpHomeList = [
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
}
