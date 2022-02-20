// Advice for Nutritional
// Post-op @ Hospital Day 1
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/training_model.dart';
import '../../../services/service_locator.dart';

class NutritionAdviceDay1 extends StatefulWidget {
  final String navigate;
  NutritionAdviceDay1({Key key, @required this.navigate}) : super(key: key);
  @override
  _NutritionAdviceDay1State createState() => _NutritionAdviceDay1State();
}

class _NutritionAdviceDay1State extends State<NutritionAdviceDay1> {
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
            if (widget.navigate == "Evaluate") {
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
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Text(
                                '''การดูแลกระตุ้นการเคลื่อนไหวของลำไส้เตรียมพร้อมรับประทานอาหาร ตามแผนการรักษา โดยทำกิจกรรม ดังนี้'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    _trainingModel
                                        .trainingLink["NutritionAdviceDay1"]),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                                '''3. การลุกออกจากเตียง โดยให้ปฏิบัติตามลำดับที่ร่างกายทนได้''',
                                style: Theme.of(context).textTheme.bodyText1),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                      '''3.1 ให้ตะแคงก่อนลุกนั่งใช้แขนช่วยลดความตึงของช่องท้อง''',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text(
                                      '''3.2 ให้ลุกนั่งช้าๆ และหยุดพักก่อนยืน ใช้การประคองบริเวณแผลเช่นเดียวกับการไอ และหายใจลึกๆ เพื่อลดความเจ็บปวดเมื่อยืน และเดินออกจากเตียง ''',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text(
                                      '''3.3 วันแรกที่สามารถลุกได้ให้เดินบริเวณรอบๆ เตียง''',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1),
                                  Text(
                                      '''3.4 ให้ลุกเดินออกห่างจากเตียงเป็นระยะ 5 เมตร และวันต่อไปให้ลุกเดินออกจากเตียงเพิ่มเป็น 10 เมตร และสามารถเพิ่มระยะทางการเดินได้ตามความสามารถของผู้ป่วย''',
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
                ),
              ),
            ),
          ],
        ),
      ));
}
