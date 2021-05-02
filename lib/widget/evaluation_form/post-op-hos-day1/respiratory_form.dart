import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';
import '../../training_information/post-op-hos-day1/respiratory_advice.dart';

class RespiratoryDay1Form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RespiratoryDay1FormState();
}

class _RespiratoryDay1FormState extends State<RespiratoryDay1Form> {
  var _value1;
  var _value2;
  var _value3;
  var _value4;
  var _value5;
  var _value6;
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
        title: Text('ภาวะแทรกซ้อนระบบทางเดินหายใจ'),
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
                        Text('ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                        Row(
                          children: [
                            Text(
                              '1. นอนท่าศีรษะสูง 45° – 60°',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('ใช่'),
                          leading: Radio(
                              value: 'ใช่',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ใช่'),
                          leading: Radio(
                              value: 'ไม่ใช่',
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
                              '''2. ออกกำลังการหายใจ''',
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
                              groupValue: _value2,
                              onChanged: (value) {
                                setState(() {
                                  _value2 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('5 -10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
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
                        Row(
                          children: [
                            Text(
                              '''3. ไออย่างมีประสิทธิภาพเมื่อมีเสมหะ''',
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
                        ListTile(
                          title: const Text('ไม่มีเสมหะ'),
                          leading: Radio(
                              value: 'ไม่มีเสมหะ',
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
                              '4. เปลี่ยนท่านอน/พลิกตะแคงตัวทุก 2 ชั่วโมง',
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
                        ListTile(
                          title: const Text(
                              'ต้องการความช่วยเหลือในการพลิกตะแคงตัว'),
                          leading: Radio(
                              value: 'ต้องการความช่วยเหลือในการพลิกตะแคงตัว',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value4,
                              onChanged: (value) {
                                setState(() {
                                  _value4 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              '5. จำนวนครั้งการดูดเครื่อง Incentive spirometer',
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
                              groupValue: _value5,
                              onChanged: (value) {
                                setState(() {
                                  _value5 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('5 -10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '5 -10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value5,
                              onChanged: (value) {
                                setState(() {
                                  _value5 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ได้ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ได้ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value5,
                              onChanged: (value) {
                                setState(() {
                                  _value5 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              '6. จำนวนลูกการดูดเครื่อง Incentive spirometer',
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
                              groupValue: _value6,
                              onChanged: (value) {
                                setState(() {
                                  _value6 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('2 ลูก'),
                          leading: Radio(
                              value: '2 ลูก',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value6,
                              onChanged: (value) {
                                setState(() {
                                  _value6 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('3 ลูก'),
                          leading: Radio(
                              value: '3 ลูก',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value6,
                              onChanged: (value) {
                                setState(() {
                                  _value6 = value;
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
                          _value4 == null ||
                          _value5 == null ||
                          _value6 == null) {
                        Dialogs.alertToCompleteEvalutation(context);
                      } else {
                        Map<String, dynamic> formDataToDB = {
                          'Exercise1': _value1,
                          'Exercise2': _value2,
                          'Exercise3': _value3,
                          'Exercise4': _value4,
                          'Exercise5': _value5,
                          'Exercise6': _value6,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'Respiratory', data: formDataToDB);
                        if (_value1 == "ใช่" &&
                            _value2 == "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                            (_value3 == "ปฏิบัติ" || _value3 == "ไม่มีเสมหะ") &&
                            _value4 == "ปฏิบัติ" &&
                            _value5 == "5 -10 ครั้ง/รอบ/ชั่วโมง" &&
                            (_value6 == "2 ลูก" || _value6 == "3 ลูก")) {
                          result = "Pass";
                          showAdvise1(context, result);
                        } else {
                          result = "NoPass";
                          showAdvise1(context, result);
                          var creation = _calculationService.formatDate(
                              date: DateTime.now());
                          var patientState = _anSubCollection['state'];
                          _firebaseService.addNotification({
                            'formName': 'Respiratory',
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
                        RespiratoryAdviceDay1(navigate: navigate)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("การป้องกันภาวะแทรกซ้อนระบบทางเดินหายใจ",
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
