import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../training_information/post-op-home/daily_activity_advice.dart';
import '../training_information/post-op-home/infection_advice.dart';
import '../training_information/post-op-hos-day1/nutrition_advice.dart';
import '../training_information/post-op-hos-day2-7/behave_advice.dart';
import '../training_information/post-op-hos-day2-7/digestive_rehabilitation_advice.dart';
import '../training_information/post-op-hos-day2-7/drain_secretion_advice.dart';
import '../training_information/post-op-hos-day2-7/pulmanary_rehabilitation_advice.dart';

class ChatTraining extends StatefulWidget {
  final String answer;
  ChatTraining({Key key, this.answer}) : super(key: key);
  @override
  _ChatTrainingState createState() => _ChatTrainingState();
}

class _ChatTrainingState extends State<ChatTraining> {
  String navigate = "Chat";
  Widget _digestiveAdvice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://youtu.be/MB7NVIb-bck"),
                  flags: YoutubePlayerFlags(autoPlay: false),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                    playedColor: Color(0xFFC37447), handleColor: Colors.amber),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DigestiveAdviceDay2(navigate: navigate)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pulmonaryAdvice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://youtu.be/fgKkGjSHISg"),
                  flags: YoutubePlayerFlags(autoPlay: false),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                    playedColor: Color(0xFFC37447), handleColor: Colors.amber),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PulmonaryAdviceDay2(navigate: navigate)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drainSecretionAdvice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("คำแนะนำเกี่ยวกับการดูแลสายระบาย"),
                    Text(
                        """1. ดูแลวางสายระบายไม่ให้หัก พับหรืองอ\n2. ประเมินการทำงานของท่อระบาย\n3. ประเมินลักษณะของแผลรอบๆ ท่อระบาย\n4. สังเกตของสีและปริมาณสิ่งคัดหลั่ง""",
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DrainSecretionAdviceDay2(navigate: navigate)));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _behaveAdvice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("คำแนะนำเกี่ยวกับการปฎิบัติตัวที่บ้านอย่างเหมาะสม"),
                    Text(
                        """1. การฟื้นฟูสภาพหลังผ่าตัด\n2. การเฝ้าระวังภาวะแทรกซ้อนหลังผ่าตัดอย่างต่อเนื่อง\n3. การติดตามการรักษาอย่างต่อเนื่อง""",
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BehaveAdviceDay2()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infectionAdvice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        """คำแนะนำเกี่ยวกับการส่งเสริมการหายของแผลและป้องกันการติดเชื้อที่แผล"""),
                    Text(
                        """1. ให้ผู้ป่วยพักผ่อนให้เพียงพออย่างน้อยวันละ 8 ชั่วโมง\n2. ดูแลทำความสะอาดแผลอย่างถูกวิธี\n3. การรับประทานอาหารที่เหมาะสม\n4. ระมัดระวังไม่ให้แผลโดนน้ำ\n5. ควรหลีกเลี่ยงการแกะหรือเกาแผล""",
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfectionAdvice()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _nutritionAdvice() {
    String navigate = "Training";
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(
                      "https://youtu.be/fgKkGjSHISg"),
                  flags: YoutubePlayerFlags(autoPlay: false),
                ),
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: ProgressBarColors(
                    playedColor: Color(0xFFC37447), handleColor: Colors.amber),
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NutritionAdviceDay1(
                              navigate: navigate,
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dailyActivityAdvice() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: Colors.grey[300],
          ),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        """คำแนะนำเกี่ยวกับการปฏิบัติกิจวัตรประจำวันภายหลังการผ่าตัดช่องท้อง"""),
                    Text(
                        """1. การออกกำลังกาย\n2. การลุกนั่ง\n3. การทำงานบ้าน\n4. การทำงาน\n5. การขับรถ\n6. การมีเพศสัมพันธ์""",
                        style: Theme.of(context).textTheme.bodyText1)
                  ],
                )),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              color: Color(0xFFF1B43F),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DailyActivityAdvice()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'รายละเอียดเพิ่มเติม',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          child: CircleAvatar(
            child: Image.asset("assets/nurse.png"),
            backgroundColor: Colors.transparent,
          ),
        ),
        (() {
          switch (widget.answer) {
            case "ออกกำลังกายบนเตียง":
              return _digestiveAdvice();
              break;
            case "การฟื้นฟูสมรรถภาพปอด":
              return _pulmonaryAdvice();
              break;
            case "การดูแลสายระบาย":
              return _drainSecretionAdvice();
              break;
            case "การปฎิบัติตัวที่เหมาะสมก่อนกลับบ้าน":
              return _behaveAdvice();
              break;
            case "การส่งเสริมการหายของแผล":
              return _infectionAdvice();
              break;
            case "การลุกออกจากเตียง":
              return _nutritionAdvice();
              break;
            case "การปฎิบัติกิจวัตรประจำวัน":
              return _dailyActivityAdvice();
              break;
          }
        }()),
      ]),
    );
  }
}
