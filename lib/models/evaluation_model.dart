import '../@enum/evaluation_form_topic.dart';

class EvaluationModel {
  List<Map<String, Object>> postOpHospitalDay0List = [
    {
      "formname": "แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.recoveryreadiness0,
    },
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
      "formname": "แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.respiratory1,
    },
    {
      "formname": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.drain1,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบายต่าง ๆ",
      "selectedform": EvaluationFormTopic.pain1,
    },
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.bloodclot1,
    },
    {
      "formname": "แบบประเมินระบบปัสสาวะ",
      "selectedform": EvaluationFormTopic.nutrition1,
    }
  ];
  List<Map<String, Object>> postOpHospitalDay2List = [
    {
      "formname": "แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.pain2,
    },
    {
      "formname": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.infection2,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบายต่าง ๆ",
      "selectedform": EvaluationFormTopic.pulmanary2,
    },
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.digestive2,
    }
  ];
  List<Map<String, Object>> postOpHomeList = [
    {
      "formname": "แบบประเมินความพร้อมการฟื้นสภาพหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.painHome,
    },
    {
      "formname": "แบบประเมินระบบทางเดินหายใจหลังผ่าตัด",
      "selectedform": EvaluationFormTopic.surgicalIncisionHome,
    },
    {
      "formname": "แบบประเมินการจัดการแผลผ่าตัดและสายระบายต่าง ๆ",
      "selectedform": EvaluationFormTopic.abnormalSymptomHome,
    },
    {
      "formname": "แบบประเมินการจัดการความปวด",
      "selectedform": EvaluationFormTopic.adlHome,
    }
  ];
}
