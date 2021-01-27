import 'package:flutter/material.dart';

import '../widget/training_information/post_op_home_training.dart';
import '../widget/training_information/pre_op_training.dart';

class TrainingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  int number;
  void navigate(int number) {
    if (number == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PreOpTrainingPage()),
      );
    } else if (number == 1) {
      print('post-op @ hospital day 0');
    } else if (number == 2) {
      print('post-op @ hospital day 1+');
    } else if (number == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostOpHomeTrainingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('การฝึกสอนและอบรบ'),
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
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: RaisedButton(
                onPressed: () {
                  number = 0;
                  navigate(number);
                },
                child: Text('Pre-op'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: RaisedButton(
                onPressed: () {
                  number = 1;
                  navigate(number);
                },
                child: Text('Post-op @ hospital Day 0'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: RaisedButton(
                onPressed: () {
                  number = 2;
                  navigate(number);
                },
                child: Text('Post-op @ hospital Day 1+'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: RaisedButton(
                onPressed: () {
                  number = 3;
                  navigate(number);
                },
                child: Text('Post-op @ home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
