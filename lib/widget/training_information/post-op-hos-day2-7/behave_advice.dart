// Proper behave advice before returning home
// Post-op @ Hospital Day 2-7
import 'package:flutter/material.dart';

class BehaveAdviceDay2 extends StatelessWidget {
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
                                '''การปฏิบัติตัวที่เหมาะสมเพื่อฟื้นฟูสภาพและเฝ้าระวังภาวะแทรกซ้อนหลังผ่าตัดอย่างต่อเนื่อง'''),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('''1. การฟื้นฟูสภาพหลังผ่าตัด''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''1.1 รับประทานยาให้ครบตามแพทย์สั่ง โดยครบตามจำนวนและเวลาตามที่กำหนด\n- ควรรับประทานยาปฏิชีวนะให้ครบจนหมด แม้จะพบว่าเริ่มมีอาการทั่วไปดีขึ้น เพื่อรักษาและป้องกันการติดเชื้อ\n- ควรรับประทานยาแก้ปวดที่ได้รับ เมื่อเริ่มรู้สึกว่าอาการปวดทนไม่ได้ เพื่อสามารถควบคุมอาการปวดได้ดี พร้อมทั้งสังเกตระดับความปวดว่าลดลงหรือไม่''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.2 ดูแลไม่ให้แผลเปียกน้ำ ควรทำความสะอาดแผลผ่าตัดวันละ 1 ครั้งที่สถานบริการพยาบาลใกล้บ้าน หรือตามสิทธิการรักษาที่ผู้ป่วยสะดวกรับบริการ''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.3 ควรรับประทานอาหารประเภทโปรตีนให้เพียงพอ โดยเลือกเนื้อสัตว์ไม่ติดมัน เช่น เนื้อไก่ เนื้อปลา หรือไข่ขาว เป็นต้น เพราะเป็นอาหารที่มีโปรตีนสูง จะช่วยส่งเสริมกระบวนการหายของแผล และควรเริ่มรับประทานอาหารครั้งละน้อยๆ ค่อยๆ เพิ่มปริมาณอาหาร เพื่อป้องกันการเกิดอาการแน่นท้อง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.4 แนะนำให้ดื่มน้ำวันละ 1000 – 2000 มล. ทั้งนี้ไม่ขัดกับแผนการรักษาของแพทย์''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.5 แนะนำนอนหลับพักผ่อนอย่างเพียงพอ อย่างน้อยวันละ 8 ชั่วโมง เพื่อให้ร่างกายได้พัก ลดเมตาบอลิสมเพื่อส่งเสริมการฟื้นฟูสภาพของร่างกาย''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.6	สามารถออกกำลังกายเบาๆ ได้ เช่น การเดิน โดยขณะเดินตัวจะต้องตรงเสมอ สามารถเริ่มจากการเดินในระยะเวลาสั้นๆประมาณ 10 นาที วันละ 2-3 ครั้ง หลังจากนั้นจึงเริ่มเดินในระยะเวลาที่นานขึ้นตามที่สามารถทำได้ และหลังจากการผ่าตัดผ่านไป 6 สัปดาห์ควรเดินได้ในระยะเวลา 30 นาที ถึง 1 ชั่วโมง\n***งดการออกกำลังกายที่ต้องเกร็งหน้าท้องภายใน 6 เดือนแรกหลังผ่าตัด เพื่อป้องกันการเกิดอาการบาดเจ็บต่อเนื้อเยื่อที่แผลผ่าตัด***''',
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
                                    '''2. การเฝ้าระวังภาวะแทรกซ้อนหลังผ่าตัดอย่างต่อเนื่อง''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''2.1 ปฏิบัติการหายใจเข้า-ออกลึกๆ การไออย่างมีประสิทธิภาพ และการดูด Incentive spirometer meter ที่บ้านเพื่อบริหารปอดอย่างต่อเนื่อง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.2 หลีกเลี่ยงไม่ให้แผลเปียกน้ำ งดการอาบน้ำในอ่างอาบน้ำ หรือการแช่ตัวในสระ''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.3 หลีกเลี่ยงการเกา การดึงผิวบริเวณแผลผ่าตัด งดการใช้โลชั่นหรือน้ำมันออยล์บริเวณแผลผ่าตัด''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.4 หลีกเลี่ยงการขับรถหลังออกจากโรงพยาบาลอย่างน้อย 2 สัปดาห์''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.5 สามารถทำงานบ้านเบาๆ ได้ งดการทำกิจกรรมมที่ต้องยืนนานๆ และงดทำกิจกรรมที่ต้องออกแรงมากหรือกิจกรรมที่เพิ่มแรงดันในช่องท้อง เช่น หลีกเลี่ยงการยกของหนักมากกว่า 4.5 กก. ขึ้นไป หลีกเลี่ยงการนั่งยองๆ หรือถ้ามีความจำเป็นต้องดูแลเด็ก สามารถอุ้มเด็กนั่งบนตักได้แทนการยกตัวเด็กขึ้น''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.6 งดการมีเพศสัมพันธ์หลังผ่าตัดอย่างน้อย 6 สัปดาห์''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.7	ประเมินอาการและอาการแสดงที่ผู้ป่วยต้องมาโรงพยาบาลทันที ดังนี้\n- มีไข้มากกว่า 38 องศาเซลเซียส\n- มีอาการเจ็บหน้าอก หรือหายใจลำบาก\n- มีอาการปวด หรือกดเจ็บที่ขา\n- มีอาการปวดแผลมากขึ้น บริเวณแผลผ่าตัดมีอาการบวม แดง มีสิ่งคัดหลั่งออกจากแผล\n- มีอาการปวดท้อง ท้องอืด\n- มีอาการคลื่นไส้อาเจียนตลอด\n- มีอาการท้องเสียติดต่อกันตั้งแต่ 3 วัน หรือ ท้องผูกที่ไม่สามารถผายลมได้ติดต่อกันตั้งแต่ 3 วัน\n- ปัสสาวะมีสีเข้มขึ้น หรือปัสสาวะมีสีแดงปน\n- อุจจาระมีสีแดงสด หรืออุจจาระมีสีดำเข้ม''',
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
                                Text('''3. การติดตามการรักษาอย่างต่อเนื่อง''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''3.1 ควรมาตรวจตามนัด เพื่อประเมินแผลและรับคำแนะนำที่เหมาะสม''',
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
          ],
        ),
      ));
}
