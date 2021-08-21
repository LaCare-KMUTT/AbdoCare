import 'package:flutter/material.dart';
import '../@enum/training_topic.dart';
import '../models/training_model.dart';
import '../services/service_locator.dart';
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
  final _trainingModel = locator<TrainingModel>();
  TrainingViewModel();

  Future<Map<String, Widget>> getTrainings(BuildContext context) async {
    List<Map<String, Object>> postOpDay0List = [];
    List<Map<String, Object>> postOpDay1List = [];
    List<Map<String, Object>> postOpDay2List = [];
    List<Map<String, Object>> postOpHomeList = [];
    List<Widget> postOpDay1CardList = [];
    List<Widget> postOpDay0CardList = [];
    List<Widget> postOpDay2CardList = [];
    List<Widget> postOpHomeCardList = [];
    Column postOpDay0ToColumn = Column();
    Column postOpDay1ToColumn = Column();
    Column postOpDay2ToColumn = Column();
    Column postOpHomeToColumn = Column();

    postOpDay0List.addAll(_trainingModel.postOpHosDay0List);
    postOpDay1List.addAll(_trainingModel.postOpHosDay1List);
    postOpDay2List.addAll(_trainingModel.postOpHosDay2List);
    postOpHomeList.addAll(_trainingModel.postOpHomeList);
    for (var item in postOpDay1List) {
      postOpDay1CardList.add(TrainingMenuCard().getTrainingCard(context, item));
    }
    for (var item in postOpDay0List) {
      postOpDay0CardList.add(TrainingMenuCard().getTrainingCard(context, item));
    }
    for (var item in postOpDay2List) {
      postOpDay2CardList.add(TrainingMenuCard().getTrainingCard(context, item));
    }
    for (var item in postOpHomeList) {
      postOpHomeCardList.add(TrainingMenuCard().getTrainingCard(context, item));
    }
    if (postOpDay1CardList != null) {
      postOpDay1CardList.insert(
          0,
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('คำแนะนำสำหรับการฟื้นตัวหลังผ่าตัดวันที่ 1')));
    }
    if (postOpDay0CardList != null) {
      postOpDay0CardList.insert(
          0,
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'คำแนะนำสำหรับการฟื้นตัวหลังผ่าตัดวันที่ 0 (วันที่ผ่าตัด)')));
    }
    if (postOpDay2CardList != null) {
      postOpDay2CardList.insert(
          0,
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('คำแนะนำสำหรับการฟื้นตัวหลังผ่าตัดวันที่ 2-7')));
    }
    if (postOpHomeCardList != null) {
      postOpHomeCardList.insert(
          0,
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('คำแนะนำสำหรับการฟื้นตัวหลังผ่าตัดที่บ้าน')));
    }

    postOpDay0ToColumn = Column(children: postOpDay0CardList);
    postOpDay1ToColumn = Column(children: postOpDay1CardList);
    postOpDay2ToColumn = Column(children: postOpDay2CardList);
    postOpHomeToColumn = Column(children: postOpHomeCardList);

    Map<String, Widget> cardLists = {
      'TrainingDay0': postOpDay0ToColumn,
      'TrainingDay1': postOpDay1ToColumn,
      'TrainingDay2': postOpDay2ToColumn,
      'TrainingHome': postOpHomeToColumn,
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    RespiratoryAdviceDay1(navigate: navigate)));
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
                builder: (context) =>
                    DrainSecretionAdviceDay2(navigate: navigate)));
        break;
      case TrainingTopic.pulmanaryDay2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PulmonaryAdviceDay2(navigate: navigate)));
        break;
      case TrainingTopic.digestiveDay2:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DigestiveAdviceDay2(navigate: navigate)));
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
