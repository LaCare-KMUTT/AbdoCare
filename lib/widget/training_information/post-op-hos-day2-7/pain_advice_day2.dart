// Advice for prevent pain
// Post-op @ Hospital Day 2-7
import 'package:flutter/material.dart';

class PainAdviceDay2 extends StatelessWidget {
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
            Navigator.pop(context);
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
                            child: Text('การจัดการความปวดด้วยตนเอง มีดังนี้'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '1. ให้ผู้ป่วยพลิกตัวให้อยู่ในท่าที่สุขสบาย',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('2. การหายใจเป็นจังหวะสม่ำเสมอ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''2.1 สูดลมหายใจเต็มปอดช้าๆ นับหนึ่งกลั้นไว้สักครู่ และ ค่อยๆหายใจออกช้าๆ''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.2 ระหว่างนี้อาจทำสมาธิจากการมุ่งความสนใจที่ลมหายใจเข้า-ออก''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text('3.	ลูบเบาๆ บริเวณผิวหนังที่ใกล้กับแผล',
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
