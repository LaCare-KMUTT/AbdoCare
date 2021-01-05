// Advice for Nutritional
// Post-op @ Hospital Day 1
import 'package:flutter/material.dart';

class NutritionAdviceDay1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
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
                            child: Text(
                                '''การดูแลกระตุ้นการเคลื่อนไหวของลำไส้เตรียมพร้อมรับประทานอาหาร ตามแผนการรักษา โดยทำกิจกรรม ดังนี้'''),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''1.	ลุกนั่งบนเตียงอย่างน้อย 2 ชั่วโมง โดยให้ตะแคงข้างก่อนลุกนั่งช้า ๆ ใช้แขนช่วยลดความตึงของแผลผ่าตัดและหน้าท้อง และหยุดนั่งพักก่อนยืน''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '2.	เดินรอบเตียง และเพิ่มการเดินระยะทาง 5 เมตร/วัน (ถ้าปฏิบัติได้ตามที่ร่างกายทนไหว) โดยใช้มือประคองแผลผ่าตัด หายใจลึกๆ เพื่อลดความเจ็บปวดเมื่อยืน และเดินออกจากเตียงอย่างช้า ๆ โดยมีคนช่วยประคองเดิน',
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
