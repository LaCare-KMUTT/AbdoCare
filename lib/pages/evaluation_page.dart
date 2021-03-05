import 'package:flutter/material.dart';
import '../services/service_locator.dart';
import '../view_models/evaluation_view_model.dart';
import '../widget/shared/loading_widget.dart';
import 'chat_page.dart';

class EvaluationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  final EvaluationViewModel _evaluationViewModel =
      locator<EvaluationViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แบบประเมินพัฒนาการของผู้ป่วย'),
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
      body: FutureBuilder<Map<String, Widget>>(
          future: _evaluationViewModel.getevaluations(context),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return loadingProgress;
            }
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: snapshot.data['mustShow'],
                ),
              ],
            );
          }),
    );
  }
}
