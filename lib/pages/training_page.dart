import 'package:flutter/material.dart';
import '../@enum/training_topic.dart';
import '../services/service_locator.dart';
import '../view_models/training_view_model.dart';
import '../widget/shared/loading_widget.dart';

class TrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  int number;
  String topic;
  String state;
  TrainingTopic selectedtopic;
  final TrainingViewModel _trainingViewModel = locator<TrainingViewModel>();

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
            Navigator.pushNamed(context, '/chat_page');
          },
        ),
      ),
      body: FutureBuilder<Map<String, Widget>>(
          future: _trainingViewModel.getTrainings(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return loadingProgress;
            }
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                snapshot.data['mustShow'],
                snapshot.data['recommended'],
              ],
            );
          }),
    );
  }
}
