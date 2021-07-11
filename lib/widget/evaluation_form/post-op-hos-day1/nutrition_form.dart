import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';
import '../../training_information/post-op-hos-day1/nutrition_advice.dart';

class NutritionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NutritionFormState();
}

class _NutritionFormState extends State<NutritionForm> {
  var _value1;
  var _value2;
  var _value3;
  var _value4;
  String result;

  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  var _anSubCollection;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    _anSubCollection = await _firebaseService.getLatestAnSubCollection(
        userId: UserStore.getValueFromStore('storedUserId'));
    print('_anSubCollectionHere $_anSubCollection');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('การจัดการภาวะโภชนาการ'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.pushNamed(context, '/evaluation_page');
          },
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text('''ดูคลิปวิดีโอพร้อมทำแบบประเมิน'''),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  "https://youtu.be/hn8kQaT-qe8"),
                              flags: YoutubePlayerFlags(autoPlay: false),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.amber,
                            progressColors: ProgressBarColors(
                                playedColor: Color(0xFFC37447),
                                handleColor: Colors.amber),
                          ),
                        ),
                        Text('ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                        Row(
                          children: [
                            Text(
                              '''1. การจัดการภาวะโภชนาการ:\n\t1.1 การผายลมครั้งแรก''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('มี'),
                          leading: Radio(
                              value: 'มี',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่มี'),
                          leading: Radio(
                              value: 'ไม่มี',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              '''\t1.2 การเรอ''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('มี'),
                          leading: Radio(
                              value: 'มี',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value2,
                              onChanged: (value) {
                                setState(() {
                                  _value2 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่มี'),
                          leading: Radio(
                              value: 'ไม่มี',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value2,
                              onChanged: (value) {
                                setState(() {
                                  _value2 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              '''2. การเคลื่อนไหวของลำไส้''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '''\t2.1 ลุกนั่งบนเตียงอย่างน้อย 2 ชั่วโมง:''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('ปฏิบัติ'),
                          leading: Radio(
                              value: 'ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value3,
                              onChanged: (value) {
                                setState(() {
                                  _value3 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value3,
                              onChanged: (value) {
                                setState(() {
                                  _value3 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              '''\t2.2 เดินระยะทาง 5 เมตร''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('ปฏิบัติ'),
                          leading: Radio(
                              value: 'ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value4,
                              onChanged: (value) {
                                setState(() {
                                  _value4 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value4,
                              onChanged: (value) {
                                setState(() {
                                  _value4 = value;
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2ED47A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                  onPressed: () async {
                    if (_value1 == null ||
                        _value2 == null ||
                        _value3 == null ||
                        _value4 == null) {
                      Dialogs.alertToCompleteEvalutation(context);
                    } else {
                      Map<String, dynamic> formDataToDB = {
                        'Exercise1': _value1,
                        'Exercise2': _value2,
                        'Exercise3': _value3,
                        'Exercise4': _value4,
                      };
                      var formId =
                          await _firebaseService.addDataToFormsCollection(
                              formName: 'Nutrition', data: formDataToDB);
                      if (_value1 == "มี" &&
                          _value2 == "มี" &&
                          _value3 == "ปฏิบัติ" &&
                          _value4 == "ปฏิบัติ") {
                        result = "Pass";
                        showAdvise1(context, result);
                      } else {
                        result = "NoPass";
                        showAdvise1(context, result);
                        var userId =
                            UserStore.getValueFromStore('storedUserId');
                        await _firebaseService.addNotification(
                            formId: formId,
                            formName: 'Nutrition',
                            userId: userId);
                      }
                    }
                  },
                  child: Text('สำเร็จ',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAdvise1(BuildContext context, String result) {
    String navigate = "Evaluate";
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ผลการประเมิน", style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (() {
                  if (result == "Pass") {
                    return Text("ผู้ป่วยผ่านแบบประเมิน",
                        style: Theme.of(context).textTheme.bodyText1);
                  } else {
                    return Text("ผู้ป่วยไม่ผ่านแบบประเมิน",
                        style: Theme.of(context).textTheme.bodyText1);
                  }
                }())
              ],
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFC37447),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        NutritionAdviceDay1(navigate: navigate)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("คำแนะนำเพื่อกระตุ้นการเคลื่อนไหวของลำไส้",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFC37447),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/evaluation_page');
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("ตกลง",
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
