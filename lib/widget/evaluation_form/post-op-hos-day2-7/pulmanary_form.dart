import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';
import '../../training_information/post-op-hos-day2-7/pulmanary_rehabilitation_advice.dart';

class PulmanaryForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PulmanaryFormState();
}

class _PulmanaryFormState extends State<PulmanaryForm> {
  var _value1;
  var _value2;
  var _value3;
  var _value4;
  String result;

  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
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
        title: Text('การฟื้นฟูสมรรถภาพของปอด'),
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
                        Text('ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                        Row(
                          children: [
                            Text(
                              '1. ออกกำลังการหายใจ (deep breathing)',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('5 -10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ได้ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ได้ปฏิบัติ',
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
                              '''2. ไออย่างมีประสิทธิภาพเมื่อมีเสมหะ (effective cough)''',
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
                              groupValue: _value2,
                              onChanged: (value) {
                                setState(() {
                                  _value2 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ได้ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ได้ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value2,
                              onChanged: (value) {
                                setState(() {
                                  _value2 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่มีเสมหะ'),
                          leading: Radio(
                              value: 'ไม่มีเสมหะ',
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
                              '''3. การหายใจโดยใช้เครื่อง Incentive spirometer:\nจำนวนครั้ง:''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value3,
                              onChanged: (value) {
                                setState(() {
                                  _value3 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('5 -10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value3,
                              onChanged: (value) {
                                setState(() {
                                  _value3 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ได้ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ได้ปฏิบัติ',
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
                              'จำนวนลูก:',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('1 ลูก'),
                          leading: Radio(
                              value: '1 ลูก',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value4,
                              onChanged: (value) {
                                setState(() {
                                  _value4 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('2 ลูก'),
                          leading: Radio(
                              value: '2 ลูก',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value4,
                              onChanged: (value) {
                                setState(() {
                                  _value4 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('3 ลูก'),
                          leading: Radio(
                              value: '3 ลูก',
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
                RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    child: Text('สำเร็จ',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    color: Color(0xFF2ED47A),
                    onPressed: () async {
                      if (_value1 == null ||
                          _value2 == null ||
                          _value3 == null ||
                          _value4 == null) {
                        Dialogs.alertDialog(context);
                      } else {
                        Map<String, dynamic> formDataToDB = {
                          'Exercise1': _value1,
                          'Exercise2': _value2,
                          'Exercise3': _value3,
                          'Exercise4': _value4,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'Pulmanary', data: formDataToDB);
                        print("finish add data");
                        if (_value1 == "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                            (_value2 == "ปฏิบัติ" || _value2 == "ไม่มีเสมหะ") &&
                            _value3 == "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                            (_value4 == "2 ลูก" || _value4 == "3 ลูก")) {
                          result = "Pass";
                          showAdvise1(context, result);
                        } else {
                          result = "NoPass";
                          showAdvise1(context, result);
                          var creation = _calculationService.formatDate(
                              date: DateTime.now());
                          var patientState = _anSubCollection['state'];
                          _firebaseService.addNotification({
                            'formName': 'Pulmanary',
                            'formId': formId,
                            'userId':
                                UserStore.getValueFromStore('storedUserId'),
                            'creation': creation,
                            'patientState': patientState,
                            'seen': false,
                          });
                        }
                      }
                    }),
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
                    return Text("ผ่าน",
                        style: Theme.of(context).textTheme.bodyText1);
                  } else {
                    return Text("ไม่ผ่าน",
                        style: Theme.of(context).textTheme.bodyText1);
                  }
                }())
              ],
            ),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "คำแนะนำการฟื้นฟูสมรรถภาพของปอด",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PulmonaryAdviceDay2(navigate: navigate)),
            );
          },
        ),
        RaisedButton(
          color: Color(0xFFC37447),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                "ตกลง",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/evaluation_page');
          },
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (context) => alert,
    );
  }
}
