import 'package:flutter/material.dart';

import '../@enum/patient_state.dart';
import '../@enum/training_topic.dart';
import '../models/training_model.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import '../stores/user_store.dart';
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
import '../widget/training_information/training_menu_card.dart';

class TrainingViewModel {
  final _firebaseService = locator<IFirebaseService>();
  final _trainingModel = locator<TrainingModel>();

  TrainingViewModel();

  Future<Map<String, Widget>> getTrainings(BuildContext context) async {
    String patientState;
    List<Map<String, Object>> recomendedList = [];
    List<Map<String, Object>> mustShowList = [];
    List<Widget> mustShowCardList = [];
    List<Widget> recommendedCardList = [];
    Column mustShowToColumn = Column();
    Column recommendedToColumn = Column();

    patientState = await _firebaseService
        .getLatestAnSubCollection(
            userId: UserStore.getValueFromStore('storedUserId'))
        .then((value) {
      return value['state'];
    });

    if (patientState == enumToString(PatientState.preOperation)) {
      mustShowList.addAll(_trainingModel.postOpHospitalList);
      mustShowList.addAll(_trainingModel.postOpHomeList);
    } else if (patientState ==
        enumToString(PatientState.postOperationHospital)) {
      mustShowList.addAll(_trainingModel.postOpHospitalList);
      recomendedList.addAll(_trainingModel.postOpHomeList);
    } else if (patientState == enumToString(PatientState.postOperationHome)) {
      mustShowList.addAll(_trainingModel.postOpHomeList);
      recomendedList.addAll(_trainingModel.postOpHospitalList);
    }
    for (var item in mustShowList) {
      mustShowCardList.add(TrainingMenuCard().getTrainingCard(context, item));
    }
    for (var item in recomendedList) {
      recommendedCardList
          .add(TrainingMenuCard().getTrainingCard(context, item));
    }
    if (mustShowCardList != null) {
      mustShowCardList.insert(
          0,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('คำแนะนำที่ควรทราบ'),
          ));

      mustShowToColumn = Column(
        children: mustShowCardList,
      );
    }
    if (recommendedCardList != null) {
      recommendedCardList.insert(
          0,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('คำแนะนำอื่นๆ'),
          ));

      recommendedToColumn = Column(children: recommendedCardList);
    }

    Map<String, Widget> cardLists = {
      'mustShow': mustShowToColumn,
      'recommended': recommendedToColumn,
    };

    return cardLists;
  }

  void navigateOnTopic(TrainingTopic selected, BuildContext context) {
    String navigate = "Training";
    switch (selected) {
      case TrainingTopic.respiratoryDay0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RespiratoryAdviceDay0(navigate: navigate)));
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    BloodclotsAdviceDay1(navigate: navigate)));
        break;
      case TrainingTopic.nutritionDay1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NutritionAdviceDay1(navigate: navigate)));
        break;
      case TrainingTopic.painDay2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PainAdviceDay2(navigate: navigate)));
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
            context,
            MaterialPageRoute(
                builder: (context) => PainAdvice(navigate: navigate)));
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
