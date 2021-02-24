import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../training_information/post-op-hos-day2-7/digestive_rehabilitation_advice.dart';
import '../training_information/post-op-hos-day2-7/pulmanary_rehabilitation_advice.dart';

class ChatTraining extends StatefulWidget {
  final String answer;
  ChatTraining({Key key, this.answer}) : super(key: key);
  @override
  _ChatTrainingState createState() => _ChatTrainingState();
}

class _ChatTrainingState extends State<ChatTraining> {
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
                        builder: (context) => DigestiveAdviceDay2()));
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
                        builder: (context) => PulmonaryAdviceDay2()));
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
            child: Image.asset("assets/robot.jpg"),
            backgroundColor: Colors.transparent,
          ),
        ),
        (() {
          if (widget.answer == "ออกกำลังกายบนเตียง") {
            return _digestiveAdvice();
          } else if (widget.answer == "การฟื้นฟูสมรรถภาพปอด") {
            return _pulmonaryAdvice();
          }
        }()),
      ]),
    );
  }
}
