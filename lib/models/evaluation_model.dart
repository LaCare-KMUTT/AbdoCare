import '../@enum/evaluation_form_topic.dart';

class EvaluationModel {
  List<Map<String, Object>> postOpHospitalDay0List = [
    {
      "formName": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedForm": EvaluationFormTopic.respiratory0,
    },
    {
      "formName": "แบบประเมินการจัดการแผลผ่าตัดและสายระบาย",
      "selectedForm": EvaluationFormTopic.drain0,
    },
    {
      "formName": "แบบประเมินระบบปัสสาวะ",
      "selectedForm": EvaluationFormTopic.urology0,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay1List = [
    {
      "formName": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedForm": EvaluationFormTopic.respiratory1,
    },
    {
      "formName": "แบบประเมินการจัดการแผลผ่าตัดและสายระบาย",
      "selectedForm": EvaluationFormTopic.drain1,
    },
    {
      "formName": "แบบประเมินป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
      "selectedForm": EvaluationFormTopic.bloodclot1,
    },
    {
      "formName": "แบบประเมินการจัดการภาวะโภชนาการ",
      "selectedForm": EvaluationFormTopic.nutrition1,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay2List = [
    {
      "formName": "แบบประเมินการเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
      "selectedForm": EvaluationFormTopic.infection2,
    },
    {
      "formName": "แบบประเมินการฟื้นฟูสมรรถภาพของปอด",
      "selectedForm": EvaluationFormTopic.pulmanary2,
    },
    {
      "formName": "แบบประเมินการฟื้นฟูระบบทางเดินอาหาร",
      "selectedForm": EvaluationFormTopic.digestive2,
    }
  ];
  List<Map<String, Object>> postOpHomeList = [
    {
      "formName": "แบบประเมินการจัดการความปวด",
      "selectedForm": EvaluationFormTopic.painHome,
    },
    {
      "formName": "แบบประเมินแผล",
      "selectedForm": EvaluationFormTopic.surgicalIncisionHome,
    },
    {
      "formName": "แบบประเมินอาการแสดงที่ผิดปกติ",
      "selectedForm": EvaluationFormTopic.abnormalSymptomHome,
    },
    {
      "formName": "แบบประเมินการปฏิบัติกิจวัตรประจำวัน",
      "selectedForm": EvaluationFormTopic.adlHome,
    }
  ];
}
