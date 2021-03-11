import '../@enum/evaluation_form_topic.dart';

class EvaluationModel {
  List<Map<String, Object>> postOpHospitalDay0List = [
    {
      "formname": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.respiratory0,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบายต่าง ๆ",
      "selectedform": EvaluationFormTopic.drain0,
    },
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.pain0,
    },
    {
      "formname": "แบบประเมินระบบปัสสาวะ",
      "selectedform": EvaluationFormTopic.urology0,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay1List = [
    {
      "formname": "แบบประเมินป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
      "selectedform": EvaluationFormTopic.respiratory1,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบายต่าง ๆ",
      "selectedform": EvaluationFormTopic.drain1,
    },
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.pain1,
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
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.pain2,
    },
    {
      "formname": "แบบประเมินการเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
      "selectedform": EvaluationFormTopic.infection2,
    },
    {
      "formname": "แบบประเมินการฟื้นฟูสมรรถภาพของปอด",
      "selectedform": EvaluationFormTopic.pulmanary2,
    },
    {
      "formname": "การประเมินการฟื้นฟูระบบทางเดินอาหาร",
      "selectedform": EvaluationFormTopic.digestive2,
    }
  ];
  List<Map<String, Object>> postOpHomeList = [
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.painHome,
    },
    {
      "formname": "แบบประเมินการประเมินแผล",
      "selectedform": EvaluationFormTopic.surgicalIncisionHome,
    },
    {
      "formname": "แบบประเมินอาการแสดงที่ผิดปกติ",
      "selectedform": EvaluationFormTopic.abnormalSymptomHome,
    },
    {
      "formname": "แบบประเมินการปฏิบัติกิจวัตรประจำวันหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.adlHome,
    }
  ];
}
