import 'package:flutter/material.dart';
import '../@enum/evaluation_form_topic.dart';
import '../@enum/patient_state.dart';
import '../models/evaluation_model.dart';
import '../services/interfaces/calculation_service_interface.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import '../stores/user_store.dart';
import '../widget/evaluation_form/evaluation_menu_card.dart';
import '../widget/evaluation_form/post-op-home/abnormal_symptom_form.dart';
import '../widget/evaluation_form/post-op-home/adl_form.dart';
import '../widget/evaluation_form/post-op-home/pain_form.dart';
import '../widget/evaluation_form/post-op-home/surgical_incision_form.dart';
import '../widget/evaluation_form/post-op-hos-day0/respiratory_form.dart';
import '../widget/evaluation_form/post-op-hos-day0/urology_form.dart';
import '../widget/evaluation_form/post-op-hos-day1/blood_clot_form.dart';
import '../widget/evaluation_form/post-op-hos-day1/drain_form.dart';
import '../widget/evaluation_form/post-op-hos-day1/nutrition_form.dart';
import '../widget/evaluation_form/post-op-hos-day1/respiratory_form.dart';
import '../widget/evaluation_form/post-op-hos-day2-7/digestive_form.dart';
import '../widget/evaluation_form/post-op-hos-day2-7/infection_form.dart';
import '../widget/evaluation_form/post-op-hos-day2-7/pulmanary_form.dart';

class EvaluationViewModel {
  final _firebaseService = locator<IFirebaseService>();
  final _evaluationModel = locator<EvaluationModel>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();

  Future<Map<String, Widget>> getevaluations(BuildContext context) async {
    String patientState;
    var _anSubCollection;
    List<Map<String, Object>> mustShowList = [];
    List<Widget> mustShowCardList = [];
    Column mustShowToColumn = Column();
    patientState = await _firebaseService
        .getLatestAnSubCollection(
            userId: UserStore.getValueFromStore('storedUserId'))
        .then((value) {
      return value['state'];
    });
    _anSubCollection = await _firebaseService.getLatestAnSubCollection(
        userId: UserStore.getValueFromStore('storedUserId'));
    var latestStateChange = _anSubCollection['latestStateChange'].toDate();
    var dayInCurrentState = _calculationService.calculateDayDifference(
        day: latestStateChange,
        compareTo: _calculationService.formatDate(date: DateTime.now()));

    if (patientState == enumToString(PatientState.preOperation)) {
      //mustShowList.addAll(_trainingModel.postOpHospitalList);
    } else if (patientState ==
        enumToString(PatientState.postOperationHospital)) {
      if (dayInCurrentState == 0) {
        mustShowList.addAll(_evaluationModel.postOpHospitalDay0List);
      }
      if (dayInCurrentState == 1) {
        mustShowList.addAll(_evaluationModel.postOpHospitalDay1List);
      }
      if (dayInCurrentState >= 2) {
        mustShowList.addAll(_evaluationModel.postOpHospitalDay2List);
      }
    } else if (patientState == enumToString(PatientState.postOperationHome)) {
      mustShowList.addAll(_evaluationModel.postOpHomeList);
    }
    for (var item in mustShowList) {
      mustShowCardList
          .add(EvaluationMenuCard().getEvaluationCard(context, item));
    }

    if (mustShowCardList != null) {
      mustShowToColumn = Column(
        children: mustShowCardList,
      );
    }

    Map<String, Widget> cardLists = {
      'mustShow': mustShowToColumn,
    };

    return cardLists;
  }

  void navigateOnTopic(EvaluationFormTopic selected, BuildContext context) {
    switch (selected) {
      case EvaluationFormTopic.respiratory0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RespiratoryDay0Form()));
        break;
      case EvaluationFormTopic.drain0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DrainForm()));
        break;
      case EvaluationFormTopic.pain0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainForm()));
        break;
      case EvaluationFormTopic.urology0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UrologyForm()));
        break;
      case EvaluationFormTopic.respiratory1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RespiratoryDay1Form()));
        break;
      case EvaluationFormTopic.drain1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DrainForm()));
        break;
      case EvaluationFormTopic.pain1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainForm()));
        break;
      case EvaluationFormTopic.bloodclot1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BloodClotForm()));
        break;
      case EvaluationFormTopic.nutrition1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NutritionForm()));
        break;
      case EvaluationFormTopic.pain2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainForm()));
        break;
      case EvaluationFormTopic.infection2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InfectionForm()));
        break;
      case EvaluationFormTopic.pulmanary2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PulmanaryForm()));
        break;
      case EvaluationFormTopic.digestive2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DigestiveForm()));
        break;
      case EvaluationFormTopic.painHome:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PainForm()));
        break;
      case EvaluationFormTopic.surgicalIncisionHome:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SurgicalIncisionForm()));
        break;
      case EvaluationFormTopic.abnormalSymptomHome:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AbnormalSymptomForm()));
        break;
      case EvaluationFormTopic.adlHome:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ADLForm()));
        break;
    }
  }
}
