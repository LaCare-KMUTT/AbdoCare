import 'package:flutter/material.dart';
import '../../services/service_locator.dart';
import '../../view_models/evaluation_view_model.dart';

class EvaluationMenuCard {
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();

  Widget getEvaluationCard(
      BuildContext context, Map<String, Object> item, String evaluateStatus) {
    var evaluationCard = Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFF5F5F5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
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
                        if (evaluateStatus == "completed") {
                          return Icon(
                            Icons.check_box,
                            color: Colors.green,
                            size: 40.0,
                          );
                        } else {
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

  Widget getEvaluationdefault(BuildContext context, String result) {
    var evaluation = Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/nurse2.png', height: 250, width: 250),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
    return evaluation;
  }
}
