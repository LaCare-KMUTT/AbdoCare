import 'package:flutter/material.dart';

class FoodAdvice extends StatelessWidget {
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''ผู้ป่วยที่ได้รับการผ่าตัดในระบบทางเดินอาหาร แนะนำการรับประทานอาหารดังนี้'''),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''1. ควรรับประทานอาหารประเภทโปรตีนให้เพียงพอ โดยเลือกเนื้อสัตว์ไม่ติดมัน เช่น เนื้อไก่ เนื้อปลา ไข่ขาว เป็นต้น เพราะเป็นอาหารที่โปรตีนสูง มีลักษณะนุ่ม เคี้ยวง่าย การย่อยและดูดซึมได้ดี''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''2. ดื่มนมอย่างน้อยวันละ 1 แก้ว หากมีปัญหาไขมันในเลือดสูงให้ดื่มนมพร่องมันเนย หรือนมถั่วเหลืองแทน หากมีอาการท้องอืดหรือท้องเสียเนื่องจากร่างกายไม่สามารถย่อยน้ำตาลแลกโตสในนมวัวได้ ควรเปลี่ยนเป็นนมเปรี้ยว โยเกิร์ตหรือนมถั่วเหลือง''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''3. ควรรับประทานผักหลาย ๆ ชนิดสลับกัน ควรเป็นผักที่นึ่งหรือต้มจนสุกไม่ควรบริโภคผักสด เนื่องจากย่อยยาก เกิดแก๊สท้องอืดท้องเฟ้อได้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''4. ควรรับประทานผลไม้ทุกวันเพื่อให้ได้วิตามินซีและใยอาหาร และควรเป็นผลไม้เนื้อนุ่ม เคี้ยวง่าย เช่น มะละกอ กล้วยสุก แต่ถ้าผู้สูงอายุเป็นโรคเบาหวานหรือน้ำหนักตัวมาก ไม่ควรรับประทานผลไม้ที่มีรสหวานจัด เช่น ลำไย ทุเรียน ขนุน เป็นต้น''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''5. อาจแบ่งมื้ออาหารเป็นวันละ 5-6 มื้อเพื่อป้องกันการแน่นท้อง โดยมื้อกลางวันเป็นอาหารหลักและเพิ่มมื้ออาหารในช่วงสายหรือบ่าย''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''ผู้ป่วยที่ได้รับการผ่าตัดเกี่ยวกับตับและทางเดินน้ำดี แนะนำการรับประทานอาหารดังนี้'''),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''1. ควรรับประทานอาหารประเภทโปรตีนให้เพียงพอ โดยเลือกเนื้อสัตว์ไม่ติดมัน เช่น เนื้อปลา ไข่ขาว เป็นต้น เพราะเป็นอาหารที่โปรตีนสูง มีลักษณะนุ่ม เคี้ยวง่าย การย่อยและดูดซึมได้ดี''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''2. ดื่มนมอย่างน้อยวันละ 1 แก้ว โดยดื่มนมพร่องมันเนย หรือนมถั่วเหลืองแทน หากมีอาการท้องอืดหรือท้องเสียเนื่องจากร่างกายไม่สามารถย่อยน้ำตาลแลกโตสในนมวัวได้ ควรเปลี่ยนเป็นนมเปรี้ยว โยเกิร์ตหรือนมถั่วเหลือง''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''3. ควรรับประทานผักหลาย ๆ ชนิดสลับกัน ควรเป็นผักที่นึ่งหรือต้มจนสุกไม่ควรบริโภคผักสด เนื่องจากย่อยยาก เกิดแก๊สท้องอืดท้องเฟ้อได้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''4. ควรรับประทานผลไม้ทุกวันเพื่อให้ได้วิตามินซีและใยอาหาร และควรเป็นผลไม้เนื้อนุ่ม เคี้ยวง่าย เช่น มะละกอ กล้วยสุก แต่ถ้าผู้สูงอายุเป็นโรคเบาหวานหรือน้ำหนักตัวมาก ไม่ควรรับประทานผลไม้ที่มีรสหวานจัด เช่น ลำไย ทุเรียน ขนุน เป็นต้น''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''5. หลีกเลี่ยงการรับประทานอาหารที่มีไขมันสูง เช่น อาหารประเภททอด เนื่องจากความสามารถในการย่อยไขมันของผู้รับบริการลดลง''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''6. อาจแบ่งมื้ออาหารเป็นวันละ 5-6 มื้อเพื่อป้องกันการแน่นท้อง โดยมื้อกลางวันเป็นอาหารหลักและเพิ่มมื้ออาหารในช่วงสายหรือบ่าย''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
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
      ));
}
