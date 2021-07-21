import 'package:flutter/material.dart';

import '../../services/service_locator.dart';
import '../../view_models/training_view_model.dart';

class TrainingMenuCard {
  final TrainingViewModel _trainingViewModel = locator<TrainingViewModel>();

  Widget getTrainingCard(BuildContext context, Map<String, Object> item) {
    var trainingCard = Container(
      padding: EdgeInsets.only(bottom: 5),
      // color: Colors.grey[100],
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            onPrimary: Colors.white,
            primary: Colors.white70),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(item['topic'],
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ],
                  ),
                ),
              ),
              Icon(Icons.navigate_next, size: 32, color: Color(0xFFC37447)),
            ],
          ),
        ),
        onPressed: () {
          var selectedtopic = item['selectedtopic'];
          _trainingViewModel.navigateOnTopic(selectedtopic, context);
        },
      ),
    );

    return trainingCard;
  }
}
