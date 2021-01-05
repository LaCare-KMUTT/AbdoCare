// Digestive rehabilitation advice to prevent intestinal complications
// Post-op @ Hospital Day 2-7
import 'package:flutter/material.dart';

class DigestiveAdviceDay2 extends StatelessWidget {
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
                                '''การออกกำลังกายเพื่อกระตุ้นการเคลื่อนไหวของลำไส้ให้มีประสิทธิภาพมีดังนี้'''),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '''1.	การออกกำลังกายบนเตียง คือ ให้ผู้ป่วยงอและเหยียดข้อต่างๆ ทุกข้อ โดยให้ปฏิบัติวันละ 2 ครั้ง ดังนี้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''1.1 ข้อเท้า - ให้ผู้ป่วยกระดกข้อเท้าทั้ง 2 ข้าง (ทีละข้าง) ขึ้นและลงเร็วๆ 10 ครั้ง/รอบ/ชั่วโมง และหมุนข้อเท้าจากซ้ายไปขวา ทำซ้ำหมุนจากขวาไปซ้าย 10 ครั้ง/รอบ/ชั่วโมง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.2 ข้อนิ้วเท้า - ให้ผู้ป่วยชี้หัวแม่เท้าและงอลงไปทางพื้นเตียงและกระดกขึ้นมาหาตัวเอง 10 ครั้ง/รอบ/ชั่วโมง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.3 ข้อเข่า - ให้ผู้ป่วยนอนบนเตียงให้ศีรษะสูงประมาณ 45 องศา เริ่มที่ขาข้างขวา งอหัวเข่า ยกเท้าขึ้นจากเตียง ค้างไว้ 5 วินาที แล้วยืดขา เหยียดเข่า และวางลงบนเตียง โดยทำซ้ำข้างละ 5 ครั้ง/รอบ/ชั่วโมง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.4 ข้อเข่า - ให้ผู้ป่วยนอนบนเตียงให้ศีรษะสูงประมาณ 45 องศา งอหัวเข่าขึ้นมา วางปลายเท้าราบ และกดปลายเท้าลงไปให้น่องและขาตึง ค้างไว้ 5 วินาที แล้วยืดขา เหยียดเข่า และวางลงบนเตียง โดยทำซ้ำข้างละ 5 ครั้ง/รอบ/ชั่วโมง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.5 ข้อเข่า - ให้ผู้ป่วยชันเข่าทั้ง 2 ข้าง กางแขนทั้ง 2 ข้างออกข้างลำตัว เข่าและขาชิดกันและหมุนเข่าสลับซ้าย-ขวา โดยทำซ้ำข้างละ 10 ครั้ง/รอบ/ชั่วโมง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.6 กล้ามเนื้ออุ้งเชิงกราน - ให้ผู้ป่วยชันเข่าทั้ง 2 ข้าง กางแขนทั้ง 2 ข้างออกข้างลำตัว ยกลำตัวช่วงท้องสลับขึ้น-ลง โดยทำซ้ำข้างละ 10 ครั้ง/รอบ/ชั่วโมง''',
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '''2. การลุกออกจากเตียง โดยให้ปฏิบัติตามลำดับที่ร่างกายทนได้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''2.1 ให้ตะแคงก่อนลุกนั่งใช้แขนช่วยลดความตึงของช่องท้อง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.2 ให้ลุกนั่งช้าๆ และหยุดพักก่อนยืน ใช้การประคองบริเวณแผลเช่นเดียวกับการไอ และหายใจลึกๆ เพื่อลดความเจ็บปวดเมื่อยืน และเดินออกจากเตียง ''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.3 วันแรกที่สามารถลุกได้ให้เดินบริเวณรอบๆ เตียง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.4 วันถัดมาให้ลุกเดินออกห่างจากเตียงเป็นระยะ 5 เมตร และวันต่อไปให้ลุกเดินออกจากเตียงเพิ่มเป็น 10 เมตร และสามารถเพิ่มระยะทางการเดินได้ตามความสามารถของผู้ป่วย''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                                '''การฟื้นฟูระบบทางเดินอาหารให้กลับเป็นปกติมีดังนี้'''),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '''1. รับประทานอาหารตามชนิดของอาหารที่แพทย์สั่ง พร้อมทั้งสังเกตอาการผิดปกติหลังรับประทานอาหารทุกมื้อ เช่น ปวดท้อง แน่นท้อง ท้องอืด เพิ่มมากขึ้น หรือมีอาการคลื่นไส้ อาเจียน หากพบอาการดังกล่าวให้แจ้งพยาบาลทันที''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '''2. แนะนำให้ดื่มน้ำวันละ 1000 – 2000 มล. ทั้งนี้ไม่ขัดกับแผนการรักษาของแพทย์ เพื่อชดเชยสารน้ำในร่างกาย''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
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
