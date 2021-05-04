import 'package:flutter/material.dart';
import '../../services/service_locator.dart';
import '../../view_models/evaluation_view_model.dart';

class EvaluationMenuCard {
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();

  Widget getEvaluationCard(
      BuildContext context, Map<String, Object> item, String evaluateStatus) {
    var evaluationButton =
        _evaluationViewModel.disableEvaluationformButton(evaluateStatus);
    var evaluationCard = Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: AbsorbPointer(
          absorbing: evaluationButton,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: evaluationButton ? Colors.grey[100] : Colors.grey[300],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              side: BorderSide(color: Colors.grey[200], width: 1),
              shadowColor: Colors.black,
              onPrimary: evaluationButton ? Colors.grey[600] : Colors.black,
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
                        padding: const EdgeInsets.only(right: 10),
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
                              color: Colors.grey[500],
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
                                style: TextStyle(fontSize: 17),
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
