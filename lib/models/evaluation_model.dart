import '../@enum/evaluation_form_topic.dart';

class EvaluationModel {
  List<Map<String, Object>> postOpHospitalDay0List = [
    {
      "formname": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.respiratory0,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบาย",
      "selectedform": EvaluationFormTopic.drain0,
    },
    {
      "formname": "แบบประเมินระบบปัสสาวะ",
      "selectedform": EvaluationFormTopic.urology0,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay1List = [
    {
      "formname": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.respiratory1,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบาย",
      "selectedform": EvaluationFormTopic.drain1,
    },
    {
      "formname": "แบบประเมินป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
      "selectedform": EvaluationFormTopic.bloodclot1,
    },
    {
      "formname": "แบบประเมินการจัดการภาวะโภชนาการ",
      "selectedform": EvaluationFormTopic.nutrition1,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay2List = [
    {
      "formname": "แบบประเมินการเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
      "selectedform": EvaluationFormTopic.infection2,
    },
    {
      "formname": "แบบประเมินการฟื้นฟูสมรรถภาพของปอด",
      "selectedform": EvaluationFormTopic.pulmanary2,
    },
    {
      "formname": "แบบประเมินการฟื้นฟูระบบทางเดินอาหาร",
      "selectedform": EvaluationFormTopic.digestive2,
    }
  ];
  List<Map<String, Object>> postOpHomeList = [
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.painHome,
    },
    {
      "formname": "แบบประเมินแผล",
      "selectedform": EvaluationFormTopic.surgicalIncisionHome,
    },
    {
      "formname": "แบบประเมินอาการแสดงที่ผิดปกติ",
      "selectedform": EvaluationFormTopic.abnormalSymptomHome,
    },
    {
      "formname": "แบบประเมินการปฏิบัติกิจวัตรประจำวัน",
      "selectedform": EvaluationFormTopic.adlHome,
    }
  ];
}
