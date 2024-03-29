import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/training_model.dart';
import '../../../services/service_locator.dart';

class DailyActivityAdvice extends StatelessWidget {
  final _trainingModel = locator<TrainingModel>();
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
                                '''การปฏิบัติกิจวัตรประจำวันภายหลังการผ่าตัดช่องท้อง สามารถทำได้ดังนี้'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    _trainingModel
                                        .trainingLink["DailyActivityAdvice"]),
                                flags: YoutubePlayerFlags(autoPlay: false),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: ProgressBarColors(
                                  playedColor: Color(0xFFC37447),
                                  handleColor: Colors.amber),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '''1. การออกกำลังกาย: ควรออกกำลังกายด้วยการเดิน โดยขณะเดินตัวจะต้องตรงเสมอ''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Image.asset(
                                  'assets/training/walk.png',
                                  height: 200,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''1.1 เริ่มจากการเดินในระยะเวลาสั้นๆประมาณ 10 นาที วันละ 2-3 ครั้ง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.2 หลังจากนั้นจึงเริ่มเดินในระยะเวลาที่นานขึ้นตามที่ผู้รับบริการสามารถทำได้''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.3 หลังจากการผ่าตัดผ่านไป 6 สัปดาห์ผู้ป่วยควรเดินได้ในระยะเวลา 30 นาที ถึง 1 ชั่วโมง''',
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
                            child: Text(
                                '''2. การลุกนั่ง: ในช่วง 6 สัปดาห์แรก ควรนั่งบนเก้าอี้ที่สูงที่สามารถลุกขึ้นได้ง่ายโดยไม่ต้องออกแรงที่กล้ามเนื้อหน้าท้อง\n ***หลีกเลี่ยงการนั่งที่เก้าอี้หรือโซฟาเพราะจะทำให้เกิดการเกร็งหน้าท้องขณะลุกขึ้น ซึ่งอาจกระทบกระเทือนกับแผลผ่าตัดได้***''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Image.asset(
                            'assets/training/sit.png',
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''3. การทำงานบ้าน: การทำงานบ้านเล็กๆน้อยๆ เช่น การกวาดบ้าน การปัดฝุ่น สามารถทำได้ แต่ในระยะ 6 สัปดาห์แรกควรระวังการยืนนาน การยกของหนักที่มีน้ำหนักมากกว่า 3 – 4 กิโลกรัม หรือ การอุ้มเด็ก เป็นต้น''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Image.asset(
                            'assets/training/housework.png',
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''4. การทำงาน: สามารถกลับไปทำงานได้ตามปกติหากงานที่ทำไม่ได้มีการออกแรงมาก แต่หากเป็นงานที่ออกแรงมาก เช่น มีการยกของที่หนัก ควรพักอย่างน้อย 6 สัปดาห์จึงเริ่มทำงาน''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Image.asset(
                            'assets/training/work.png',
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''5. การขับรถ: สามารถขับรถได้ภายหลังการผ่าตัดอย่างน้อย 6 สัปดาห์ ระหว่างนี้ท่านอาจใช้รถโดยสารประจำทาง หรือรถรับจ้างแทน เพื่อป้องกันแรงกระทบการเทือนที่แผลผ่าตัด ทั้งนี้หากรู้สึกเจ็บแผลขณะคาดเข็มขัดนิรภัยอาจใช้ใช้ผ้าขนหนูพับระหว่างแผลกับเข็มขัดนิรภัยได้''',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Image.asset(
                            'assets/training/drive.png',
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '''6. การมีเพศสัมพันธ์: สามารถมีได้ตามปกติภายหลังการผ่าตัดอย่างน้อย 6 สัปดาห์''',
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
