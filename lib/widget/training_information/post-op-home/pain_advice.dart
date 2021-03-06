import 'package:flutter/material.dart';

class PainAdvice extends StatelessWidget {
  final String navigate;
  PainAdvice({Key key, @required this.navigate}) : super(key: key);
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
                            child: Text('การจัดการความปวดด้วยตนเอง มีดังนี้'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''1. ให้ผู้ป่วยจินตนาการในสถานที่ๆรู้สึกสบายเช่น ทะเล หรือภูเขา''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Image.asset(
                            'assets/training/scenery.png',
                            height: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('2. ให้ผู้ป่วยทำกิจกรรมอื่นๆ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Image.asset(
                                  'assets/training/watchTV.png',
                                  height: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text('2.1 ดูโทรทัศน์ ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text('2.2 ฟังดนตรี',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.3 พูดคุยกับสมาชิกภายในบ้านหรือบุคคลอื่น''',
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
                                Text('3. การหายใจเป็นจังหวะสม่ำเสมอ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''3.1 สูดลมหายใจเต็มปอดช้าๆ นับหนึ่งกลั้นไว้สักครู่ และ ค่อยๆหายใจออกช้าๆ''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.2 ระหว่างนี้อาจทำสมาธิจากการมุ่งความสนใจที่ลมหายใจเข้า-ออก''',
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
                                Text('4. เกร็งและผ่อนคลายกล้ามเนื้อ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''4.1 ฝึกเกร็งกล้ามเนื้อกลุ่มต่างๆให้ตึงตัวก่อน เช่น น่อง ต้นขา แผ่นหลัง หน้าท้อง สะโพก''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''4.2 จากนั้นเมื่อรู้สึกเกร็งนับ 1-3 แล้วคลายช้าๆ''',
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
