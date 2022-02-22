import 'package:flutter/material.dart';
import '../@enum/patient_state.dart';
import '../@enum/training_topic.dart';
import '../services/interfaces/calculation_service_interface.dart';
import '../services/service_locator.dart';
import '../view_models/training_view_model.dart';
import '../widget/shared/loading_widget.dart';

class TrainingPage extends StatefulWidget {
  final String patientState;
  TrainingPage({Key key, @required this.patientState}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  int number;
  String topic;
  String state;
  TrainingTopic selectedtopic;
  final TrainingViewModel _trainingViewModel = locator<TrainingViewModel>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();

  @override
  Widget build(BuildContext context) {
    var _anSubCollection;
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
                (() {
                  if (widget.patientState ==
                      enumToString(PatientState.preOperation)) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: snapshot.data['TrainingDay0'],
                            ),
                          ),
                          Card(
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: snapshot.data['TrainingDay1'],
                            ),
                          ),
                          Card(
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: snapshot.data['TrainingDay2'],
                            ),
                          ),
                          Card(
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: snapshot.data['TrainingHome'],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (widget.patientState ==
                      enumToString(PatientState.postOperationHospital)) {
                    var latestStateChange =
                        _anSubCollection['latestStateChange'].toDate();
                    var dayInCurrentState =
                        _calculationService.calculateDayDifference(
                            day: latestStateChange,
                            compareTo: _calculationService.formatDate(
                                date: DateTime.now()));
                    if (dayInCurrentState == 0) {}
                    if (dayInCurrentState == 1) {}
                    if (dayInCurrentState >= 2) {}
                  } else if (widget.patientState ==
                      enumToString(PatientState.postOperationHome)) {}
                }()),
              ],
            );
          }),
    );
  }
}
