import 'package:flutter/material.dart';

import '../../services/service_locator.dart';
import '../../view_models/training_view_model.dart';

class TrainingMenuCard {
  final TrainingViewModel _trainingViewModel = locator<TrainingViewModel>();

  Widget getTrainingCard(BuildContext context, Map<String, Object> item) {
    var trainingCard = Card(
      child: FlatButton(
        onPressed: () {
          var selectedtopic = item['selectedtopic'];
          _trainingViewModel.navigateOnTopic(selectedtopic, context);
        },
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
              Icon(
                Icons.navigate_next,
                size: 32,
              ),
            ],
          ),
        ),
      ),
    );
    return trainingCard;
  }
}
