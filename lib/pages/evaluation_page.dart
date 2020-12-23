import 'package:flutter/material.dart';
//import '../widget/evaluation_form/post-opDay0/post-op-Day0_page.dart';
import '../widget/evaluation_form/Post-opDay0/post-op-Day0_page.dart';
import '../widget/evaluation_form/pre-op/pre-op_page.dart';

class EvaluationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('แบบประเมินพัฒนาการของผู้ป่วย'),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PreOpPage()),
                    );
                  },
                  child: Text('Pre-op'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostOpDay0Page()),
                    );
                  },
                  child: Text('Post-op @ hospital Day 0'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Post-op @ hospital Day 1'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Post-op @ hospital Day 2-7'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, right: 100),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Post-op @ community Day 7-30'),
                ),
              ),
            ],
          ),
        ),
      );
}
