import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SurgicalIncisionAdvice extends StatelessWidget {
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
                                '''การดูแลแผลผ่าตัด การทำแผล มีวิธีการทำแผลดังนี้'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    "https://youtu.be/sXxHrKrE8HI"),
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
                                    '''1. หากผู้ป่วยอยู่ใกล้กับสถานพยาบาลหรือมีความสะดวกในการเดินทางไปยังสถานพยาบาล เช่น โรงพยาบาล ศูนย์ส่งเสริมสุขภาพตำบล หรือ คลินิก แนะนำให้ผู้ป่วยไปทำแผลในสถานพยาบาลใกล้บ้านนั้น''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                              Image.asset(
                                'assets/training/hospital.png',
                                height: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                        '''2. กรณีที่ผู้รับบริการต้องการทำแผลเองปฏิบัติ ดังนี้''',
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
