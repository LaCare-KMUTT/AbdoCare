import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/training_model.dart';
import '../../../services/service_locator.dart';

class InfectionAdvice extends StatelessWidget {
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
                                '''การดูแลเพื่อส่งเสริมการหายของแผลและป้องกันการติดเชื้อที่แผลผ่าตัด มีดังนี้'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    _trainingModel
                                        .trainingLink["InfectionAdvice"]),
                                flags: YoutubePlayerFlags(autoPlay: false),
                              ),
                              showVideoProgressIndicator: true,
                              progressIndicatorColor: Colors.amber,
                              progressColors: ProgressBarColors(
                                  playedColor: Color(0xFFC37447),
                                  handleColor: Colors.amber),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''1. ให้ผู้ป่วยพักผ่อนให้เพียงพออย่างน้อยวันละ 8 ชั่วโมง เพื่อลดกระบวนการเผาผลาญภายในเซลล์ที่ไม่จำเป็น เนื้อเยื่อสามารถนำออกซิเจนและสารอาหารไปใช้ได้เพียงพอ''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''2. ดูแลทำความสะอาดแผลอย่างถูกวิธี และหลีกเลี่ยงการใช้มือสัมผัสกับแผลผ่าตัด เพื่อลดการติดเชื้อที่แผลผ่าตัด''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text('3. การรับประทานอาหาร ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''4. ระมัดระวังไม่ให้แผลโดนน้ำ อาจใช้ถุงพลาสติกสะอาดปิดคลุมบริเวณแผลขณะอาบน้ำเพื่อป้องกันการซึมของน้ำเข้าแผลผ่าตัด\n***ในกรณีที่แผลผ่าตัดปิดพลาสเตอร์กันน้ำ ผู้ป่วยสามารถอาบน้ำได้ แต่ไม่ควรฟอกสบู่หรือถูบริเวณบาดแผล เพราะจะทำให้พลาสเตอร์เผยอ และน้ำซึมเข้าแผลได้***''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                    '''5. เมื่อแผลเริ่มแห้ง อาจเกิดสะเก็ดแผล ควรหลีกเลี่ยงการแกะหรือเกาแผล เพื่อป้องกันการฉีกขาดของแผลเพิ่มขึ้น''',
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
