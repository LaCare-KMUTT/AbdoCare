// Advice for surveillance for disorders of drain secretion
// Post-op @ Hospital Day 2-7
import 'package:flutter/material.dart';

class DrainSecretionAdviceDay2 extends StatelessWidget {
  final String navigate;
  DrainSecretionAdviceDay2({Key key, @required this.navigate})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("คำแนะนำ"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            if (navigate == "Evaluate") {
              Navigator.pushNamed(context, '/evaluation_page');
            }
            if (navigate == "Chat") {
              Navigator.pushNamed(context, '/chat_page');
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child:
                                Text('การดูแลสายระบายให้มีประสิทธิภาพ ดังนี้'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''1. ดูแลวางสายระบายไม่ให้หัก พับหรืองอ อาจติดพลาสเตอร์กับเสื้อเพื่อยึดสายให้อยู่ในตำแหน่งที่เหมาะสม และจัดสายท่อระบายให้พอดีไม่ดึงรั้ง โดยเฉพาะเมื่อต้องเคลื่อนไหวร่างกายหรือลุกเดินออกจากเตียง''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''2.	ประเมินการทำงานของท่อระบาย ต้องให้เป็นความดันลบหรือสูญญากาศ โดยสังเกตว่ากระเปาะแบนตลอดเวลา หรือ หัวจุกสีแดงยุบตัวติดกันตลอดเวลา''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''3.	ประเมินลักษณะของแผลรอบๆ ท่อระบาย โดยสังเกตเลือดหรือสิ่งคัดหลั่งซึม หรือพบอาการบวมแดง ให้แจ้งพยาบาลทันที''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''4.	สังเกตลักษณะของสีและปริมาณสิ่งคัดหลั่ง หากพบว่ามีสีที่ผิดปกติไปจากเดิมหรือปริมาณออกมากขึ้นแตกต่างจากวันอื่นให้แจ้งพยาบาลทันที''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
