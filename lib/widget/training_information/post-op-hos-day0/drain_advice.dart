// Advice for surgical incisions and drainage lines
// Post-op @ Hospital Day 0
import 'package:flutter/material.dart';

class DrainAdviceDay0 extends StatelessWidget {
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
                            child: Text(
                                '''การป้องกันภาวะแทรกซ้อน เช่น ช๊อก จากการเกิดอันตรายจากภาวะเลือดออกมาก มีอาการและอาการแสดง ดังนี้'''),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''1. ลักษณะแผลผ่าตัด และและสายระบายต่างๆมีเลือดออกมาก''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''2. อาการและอาการแสดงของการเสียเลือดมากจากแผลผ่าตัดและสายระบาย (ถ้าปริมาณเลือด > 200 มิลลิลิตรใน 1 ชั่วโมง) เช่น ใจสั่น หน้ามืด หัวใจเต้นเร็ว เป็นต้น''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '3.	ปริมาณปัสสาวะ > 30 มิลลิลิตรต่อชั่วโมง',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''4.	สัญญาณชีพปกติ โดยเฉพาะค่า PR, RR, BP และ O2sat''',
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
