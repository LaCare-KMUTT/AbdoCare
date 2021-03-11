// pulmonary rehabilitation advice to prevent lung complications
// Post-op @ Hospital Day 2-7
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PulmonaryAdviceDay2 extends StatefulWidget {
  final String navigate;
  PulmonaryAdviceDay2({Key key, @required this.navigate}) : super(key: key);
  @override
  _PulmonaryAdviceDay2State createState() => _PulmonaryAdviceDay2State();
}

class _PulmonaryAdviceDay2State extends State<PulmonaryAdviceDay2> {
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
            // if (widget.navigate == "Evaluate") {
            //   Navigator.pushNamed(context, '/evaluation_page');
            // } else {
            //   Navigator.pop(context);
            // }
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
                                '''การฟื้นฟูสมรรถภาพของปอด โดยให้ปฏิบัติอย่างน้อยวันละ 3 รอบๆ ละ 5 ครั้ง ดังนี้'''),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            child: YoutubePlayer(
                              controller: YoutubePlayerController(
                                initialVideoId: YoutubePlayer.convertUrlToId(
                                    "https://youtu.be/fgKkGjSHISg"),
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
                                    '''1. กระตุ้นให้บริหารการหายใจเข้าออกลึกๆ ปฏิบัติดังนี้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''1.1 ให้ผู้ป่วยนั่งตัวตรงที่ข้างเตียง หรืออยู่ในท่านั่งศีรษะสูงบนเตียง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.2 ใช้มือทั้งสองข้างจับที่ท้องจะได้รู้สึกเวลาหน้าอกขยายจะบ่งชี้ว่าปอดขยายตัว''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.3 ให้ผู้ป่วยหายใจเข้าทางจมูกจนรู้สึกว่าหน้าท้องขยาย''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''1.4 ให้ผู้ป่วยหายใจทางปากขณะกล้ามเนื้อหน้าหน้าท้องหดตัว''',
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
                                    '''2. แนะนำการไออย่างมีประสิทธิภาพ โดยให้ปฏิบัติทุกครั้งที่รู้สึกมีเสมหะ ดังนี้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''2.1 ให้ผู้ป่วยนั่งตัวตรงที่ข้างเตียง หรืออยู่ในท่านั่งศีรษะสูงบนเตียง''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.2 ให้ผู้ป่วยประคองแผลที่ทำผ่าตัด เพื่อลดแรงดันและควบคุมความเจ็บป่วยขณะไอ โดยให้กางมือกดให้แน่นบริเวณแผลก่อนไอ หรือใช้หมอนใบเล็ก หรือผ้าเช็ดตัวม้วนประคองแผลแทน''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''2.3 ให้หายใจลึกๆ 3 ครั้ง และหายใจออกทางปากก่อน ครั้งสุดท้ายให้กลั้นหายใจ 1 – 2 วินาที และไอเอาเสมหะที่ตกค้างออกมา''',
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
                                    '''3.	การบริหารการหายใจโดยใช้เครื่องบริหาร โดยปฏิบัติ 5-10 ครั้ง/ชั่วโมง ในช่วงเวลาที่ว่าง (พยายามดูดได้อย่างน้อยวันละ 100 ครั้ง/วัน ขั้นตอนการปฏิบัติดังนี้''',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                          '''3.1 ให้ผู้ป่วยนั่งตัวตรง ยกเครื่องบริหารปอดตั้งขึ้น หายใจออกปกติจากนั้นใช้ปากครอบบริเวณส่วนปลายท่อที่ใช้สำหรับดูดลมเข้าให้แน่น''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.2 ดูดลมเข้าอย่างช้าๆ สังเกตลูกสูบที่อยู่ในช่องอุปกรณ์จะเลื่อนขึ้น และให้ผู้ป่วยสูดหายใจเข้าจนสุด ค้างไว้ รักษาระดับลูกสูบที่เลื่อนขึ้นไว้เท่าที่สามารถทำได้ (อย่างน้อย 5 วินาที)''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.3 ให้อ้าปากเพื่อคลายปากออกจากที่ดูดลม แล้วหายใจออกปกติ และปล่อยให้ลูกสูบค่อยๆ เคลื่อนตัวลงมาในตำแหน่งเริ่มต้น''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''3.4	พักสักครู่แล้วเริ่มทำซ้ำอีกครั้ง''',
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
