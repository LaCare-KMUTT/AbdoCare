// Advice for Prevent blood clots
// Post-op @ Hospital Day 1
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../models/training_model.dart';
import '../../../services/service_locator.dart';

class BloodclotsAdviceDay1 extends StatefulWidget {
  final String navigate;
  BloodclotsAdviceDay1({Key key, @required this.navigate}) : super(key: key);
  @override
  _BloodclotsAdviceDay1State createState() => _BloodclotsAdviceDay1State();
}

class _BloodclotsAdviceDay1State extends State<BloodclotsAdviceDay1> {
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
                                '''การป้องกันการเกิดภาวะลิ่มเลือดอุดตันคือ การออกกำลังกายขา โดยทำทีละข้าง เริ่มจากข้างขวา'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    _trainingModel
                                        .trainingLink["BloodclotsAdviceDay1"]),
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
