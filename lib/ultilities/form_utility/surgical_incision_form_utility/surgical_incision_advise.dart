import 'package:flutter/material.dart';

import '../../../widget/evaluation_form/post-op-home/post-op-home_page.dart';

class AdvisePage extends StatelessWidget {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostOpHomePage()),
              );
            },
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                                '''การดูแลเพื่อส่งเสริมการหายของแผลและป้องกันการติดเชื้อที่แผลผ่าตัด มีดังนี้'''),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '''1. ให้ผู้ป่วยพักผ่อนให้เพียงพออย่างน้อยวันละ 8 ชั่วโมง เพื่อลดกระบวนการเผาผลาญภายในเซลล์ที่ไม่จำเป็น เนื้อเยื่อสามารถนำออกซิเจนและสารอาหารไปใช้ได้เพียงพอ''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Text(
                                    '''2. ดูแลทำความสะอาดแผลอย่างถูกวิธี และหลีกเลี่ยงการใช้มือสัมผัสกับแผลผ่าตัด เพื่อลดการติดเชื้อที่แผลผ่าตัด''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Text('3. การรับประทานอาหาร ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                          '''3.1 รับประทานอาหารประเภทโปรตีน เช่น ไข่ขาว เนื้อไก่เนื้อปลา''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.2 รับประทานอาหารที่มีวิตามินซีสูง เช่น ผลไม้รสเปรี้ยว และผักใบเขียว''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ],
                                  ),
                                ),
                                Text(
                                    '''4. ระมัดระวังไม่ให้แผลโดนน้ำ อาจใช้ถุงพลาสติกสะอาดปิดคลุมบริเวณแผลขณะอาบน้ำเพื่อป้องกันการซึมของน้ำเข้าแผลผ่าตัด''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Text(
                                    '''5. เมื่อแผลเริ่มแห้ง อาจเกิดสะเก็ดแผล ควรหลีกเลี่ยงการแกะหรือเกาแผล เพื่อป้องกันการฉีกขาดของแผลเพิ่มขึ้น''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                                '''การดูแลแผลผ่าตัด การทำแผล มีวิธีการทำแผลดังนี้'''),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                    '''1. หากผู้ป่วยอยู่ใกล้กับสถานพยาบาลหรือมีความสะดวกในการเดินทางไปยังสถานพยาบาล เช่น โรงพยาบาล ศูนย์ส่งเสริมสุขภาพตำบล หรือ คลินิก แนะนำให้ผู้ป่วยไปทำแผลในสถานพยาบาลใกล้บ้านนั้น''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Text(
                                    '''2. กรณีที่ผู้รับบริการต้องการทำแผลเองปฏิบัติ ดังนี้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                          '''2.1 จัดเตรียมอุปกรณ์สำหรับทำแผล ได้แก่ ชุดทำแผล และ น้ำยาสำหรับทำความสะอาดแผล พลาสเตอร์ หรือแผ่นผิดแผลกันน้ำ''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.2 ล้างมือด้วยน้ำสบู่ หรือ แอลกอฮอล์เจล ให้สะอาดทุกครั้งก่อนการทำแผล''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.3 เปิดชุดทำแผลด้วยความระมัดระวังการปนเปื้อน''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.4 เทน้ำยาสำหรับทำความสะอาดแผล (0.9% NSS) ลงในช่องภายในชุดทำแผล''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.5 ใช้ที่คีบสำลีตัวที่ 1 จับสำลีชุบน้ำยาทำความสะอาดแผลส่งให้คีบสำลีตัวที่ 2 และเช็ดทำความสะอาดที่ขอบแผลวนออกด้านนอก 2 – 3 นิ้ว''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.6 ใช้ที่คีบสำลีตัวที่ 1 จับสำลีชุบน้ำยาทำความสะอาดแผลส่งให้คีบสำลีตัวที่ 2 และเช็ดทำความสะอาดที่แผล''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.7 ปฏิบัติซ้ำในข้อที่ 3.5 – 3.6 จนแผลสะอาด''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.8 ปิดแผลด้วยผ้าก็อซที่มีให้ในชุดทำแผล''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
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
            ],
          ),
        ),
      );
}
