// Advice for Prevent respiratory complication
// Post-op @ Hospital Day 1
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RespiratoryAdviceDay1 extends StatefulWidget {
  final String navigate;
  RespiratoryAdviceDay1({Key key, @required this.navigate}) : super(key: key);
  @override
  _RespiratoryAdviceDay1State createState() => _RespiratoryAdviceDay1State();
}

class _RespiratoryAdviceDay1State extends State<RespiratoryAdviceDay1> {
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
                                '''การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ เช่น ภาวะปอดแฟบ ปอดอักเสบหรือการติดเชื้อระบบหายใจส่วนล่าง ควรปฏิบัติกิจกรรม ดังนี้'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    "https://youtu.be/5Vw4KJrLqTo"),
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
                            child: Text('1.	นอนท่าศีรษะสูง 45-60 องศา',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                                '2.	การเปลี่ยนท่านอน/พลิกตะแคงตัวทุก 2 ชั่วโมง',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                    '3. การออกกำลังการหายใจ 5-10 ครั้ง/รอบ/ชั่วโมง คือ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''3.1 ใช้มือทั้งสองข้างจับที่ท้องจะได้รู้สึกเวลาหน้าอกขยาย''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.2 หายใจเข้าทางจมูกจนรู้สึกว่าหน้าท้องขยาย''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.3 หายใจออกทางปากขณะกล้ามเนื้อหน้าหน้าท้องหดตัว''',
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
                                    '''4. การไออย่างมีประสิทธิภาพเมื่อมีเสมหะ คือ''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''4.1. ใช้มือประคองแผลผ่าตัด หรือหมอนใบเล็กหรือผ้าเช็ดตัวม้วนกดแผลผ่าตัดให้แน่น''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''4.2 หายใจเข้าลึกๆ และหายใจออกทางปาก 3 ครั้ง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''4.3 ครั้งที่ 3 กลั้นหายใจ 1 – 2 วินาที และไอเอาเสมหะออกมา''',
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
                                '5.	การดูดเครื่อง Incentive spirometer 5-10 ครั้ง/รอบ/ชั่วโมง',
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
