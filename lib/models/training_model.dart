import '../@enum/training_topic.dart';

class TrainingModel {
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
}
