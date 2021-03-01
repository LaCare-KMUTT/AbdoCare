import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../@enum/patient_state.dart';
import '../@enum/training_topic.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import '../view_models/training_view_model.dart';
import '../widget/shared/loading_widget.dart';
import '../widget/training_information/training_menu_card.dart';
import 'chat_page.dart';

class TrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  int number;
  String topic;
  String state;
  TrainingTopic selectedtopic;
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final TrainingViewModel _trainingViewModel = locator<TrainingViewModel>();
  var _userId;
  var _userCollection;

  @override
  void initState() {
    super.initState();
    var userId = _firebaseService.getUserId();
    setState(() {
      _userId = userId;
      _userCollection = _firebaseService.getCollectionSnapshotByDocId(
          collection: 'Users', docId: _userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การฝึกสอนและอบรม'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatPage()),
            );
          },
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _userCollection,
        builder: (context, userCollection) {
          if (!userCollection.hasData) {
            return loadingProgress;
          } else {
            return FutureBuilder<Map<String, dynamic>>(
                future:
                    _firebaseService.getLatestAnSubCollection(userId: _userId),
                builder: (context, anSubCollection) {
                  if (!anSubCollection.hasData) {
                    return loadingProgress;
                  } else if (anSubCollection.data['state'] ==
                      enumToString(PatientState.preOperation)) {
                    return ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('คำแนะนำที่ควรทราบ'),
                        ),
                        Column(
                          children: <Widget>[
                            for (var item in _trainingViewModel.postOpHospital)
                              TrainingMenuCard().getTrainingCard(context, item),
                            for (var item in _trainingViewModel.postOpHome)
                              TrainingMenuCard().getTrainingCard(context, item),
                          ],
                        ),
                      ],
                    );
                  } else if (anSubCollection.data['state'] ==
                      enumToString(PatientState.postOperationHospital)) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('คำแนะนำที่ควรทราบ'),
                        ),
                        Column(
                          children: [
                            for (var item in _trainingViewModel.postOpHospital)
                              TrainingMenuCard().getTrainingCard(context, item),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('คำแนะนำอื่นๆ'),
                        ),
                        Column(
                          children: [
                            for (var item in _trainingViewModel.postOpHome)
                              TrainingMenuCard().getTrainingCard(context, item),
                          ],
                        ),
                      ],
                    );
                  } else if (anSubCollection.data['state'] ==
                      enumToString(PatientState.postOperationHome)) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('คำแนะนำที่ควรทราบ'),
                        ),
                        Column(
                          children: [
                            for (var item in _trainingViewModel.postOpHome)
                              TrainingMenuCard().getTrainingCard(context, item),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('คำแนะนำอื่นๆ'),
                        ),
                        Column(
                          children: [
                            for (var item in _trainingViewModel.postOpHospital)
                              TrainingMenuCard().getTrainingCard(context, item),
                          ],
                        ),
                      ],
                    );
                  }
                });
          }
        },
      ),
    );
  }
}
