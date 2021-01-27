import 'package:flutter/material.dart';
import '../widget/evaluation_form/post-op-home/post-op-home_page.dart';
import '../widget/evaluation_form/pre-op/pre-op_page.dart';

class EvaluationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EvaluationPageState();
}

class _EvaluationPageState extends State<EvaluationPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('แบบประเมินพัฒนาการของผู้ป่วย'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
            tooltip: 'กลับ',
            onPressed: () {
              Navigator.pushNamed(context, '/chat_page');
            },
          ),
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
                  onPressed: () {},
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostOpHomePage()),
                    );
                  },
                  child: Text('Post-op @ home Day 7-30'),
                ),
              ),
            ],
          ),
        ),
      );
}
