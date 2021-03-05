import 'package:flutter/material.dart';
import '../../services/service_locator.dart';
import '../../view_models/evaluation_view_model.dart';

class EvaluationMenuCard {
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();

  Widget getEvaluationCard(BuildContext context, Map<String, Object> item) {
    var evaluationCard = Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: RaisedButton(
          color: Color(0xFFF5F5F5),
          onPressed: () {
            var selectedform = item['selectedform'];
            _evaluationViewModel.navigateOnTopic(selectedform, context);
          },
          child: Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: (() {
                        //Hard code for set the evaluation form check box
                        int check = 0;
                        //When evaluation form complete
                        if (check == 0) {
                          return Icon(
                            Icons.check_box,
                            color: Colors.green,
                            size: 40.0,
                          );
                        }
                        //When evaluation form incomplete
                        else {
                          return Icon(
                            Icons.check_box_outline_blank,
                            color: Colors.grey,
                            size: 40.0,
                          );
                        }
                      }()),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['formname'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return evaluationCard;
  }
}
