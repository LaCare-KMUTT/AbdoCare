// Advice for Prevent blood clots
// Post-op @ Hospital Day 1
import 'package:flutter/material.dart';

class BloodclotsAdviceDay1 extends StatelessWidget {
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
                            child: Text('''
การป้องกันการเกิดภาวะลิ่มเลือดอุดตันคือ การออกกำลังกายขา โดยทำทีละข้าง เริ่มจากข้างขวา'''),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                'ท่าที่ 1 กระดกข้อเท้าขึ้นลง ข้างละ 10 ครั้ง/รอบ/ชั่วโมง',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                'ท่าที่ 2 หมุนข้อเท้าจากซ้ายไปขวา และหมุนจากขวาไปซ้ายข้างละ 10 ครั้ง/รอบ/ชั่วโมง',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                'ท่าที่ 3 งอนิ้วเท้าลงพื้นเตียงและกระดกขึ้นเข้าหาตัวเอง 10 ครั้ง/รอบ/ชั่วโมง',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                'ท่าที่ 4 งอหัวเข่า ยกเท้าขึ้นจากเตียง ยืดขา เหยียดเข่าตรงค้างไว้ 5 วินาที และวางลงบนเตียง ข้างละ 5 ครั้ง/รอบ/ชั่วโมง',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                'ท่าที่ 5 งอหัวเข่าตั้งขึ้น วางปลายเท้าราบ และกดปลายเท้าลงไปให้น่องและขาตึง ค้างไว้ 5 วินาที แล้วยืดขาตรง เหยียดเข่า และวางลงบนเตียง ทำข้างละ 5 ครั้ง/รอบ/ชั่วโมง',
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
