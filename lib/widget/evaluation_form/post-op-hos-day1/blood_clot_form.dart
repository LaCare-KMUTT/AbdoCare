import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';
import '../../training_information/post-op-hos-day1/blood_clots_advice.dart';

class BloodClotForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BloodClotFormState();
}

class _BloodClotFormState extends State<BloodClotForm> {
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5;
  var _value6;
  var _value7;
  var _value8;
  var _value9;
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
        title: Text('การเกิดภาวะลิ่มเลือดอุดตัน'),
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
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text('ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                        CheckboxListTile(
                          value: _value1,
                          selected: _value1,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value1 = value;
                              _value4 = false;
                            });
                          },
                          title: Text('1. ขาบวมข้างเดียว'),
                        ),
                        CheckboxListTile(
                          value: _value2,
                          selected: _value2,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value2 = value;
                              _value4 = false;
                            });
                          },
                          title: Text('2. ปวดขาข้างที่บวม'),
                        ),
                        CheckboxListTile(
                          value: _value3,
                          selected: _value3,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value3 = value;
                              _value4 = false;
                            });
                          },
                          title: Text('3. ขาแดงร้อน'),
                        ),
                        CheckboxListTile(
                          value: _value4,
                          selected: _value4,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value4 = value;
                              _value1 = false;
                              _value2 = false;
                              _value3 = false;
                            });
                          },
                          title: Text('4. ขาไม่มีอาการผิดปกติ'),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text('ดูคลิปวิดีโอการออกกำลังกายขาพร้อมทำแบบประเมิน'),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: YoutubePlayer.convertUrlToId(
                                  "https://youtu.be/hCpHl0A_6TE"),
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
                              'ท่าที่ 1 ข้อเท้า',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value5,
                              onChanged: (value) {
                                setState(() {
                                  _value5 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value5,
                              onChanged: (value) {
                                setState(() {
                                  _value5 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
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
                              'ท่าที่ 2 หมุนข้อเท้า',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value6,
                              onChanged: (value) {
                                setState(() {
                                  _value6 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value6,
                              onChanged: (value) {
                                setState(() {
                                  _value6 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value6,
                              onChanged: (value) {
                                setState(() {
                                  _value6 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'ท่าที่ 3 งอนิ้วเท้า',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value7,
                              onChanged: (value) {
                                setState(() {
                                  _value7 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value7,
                              onChanged: (value) {
                                setState(() {
                                  _value7 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value7,
                              onChanged: (value) {
                                setState(() {
                                  _value7 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'ท่าที่ 4 งอหัวเข่า',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value8,
                              onChanged: (value) {
                                setState(() {
                                  _value8 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value8,
                              onChanged: (value) {
                                setState(() {
                                  _value8 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value8,
                              onChanged: (value) {
                                setState(() {
                                  _value8 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'ท่าที่ 5 งอหัวเข่าตั้งขึ้น',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: '5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value9,
                              onChanged: (value) {
                                setState(() {
                                  _value9 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value9,
                              onChanged: (value) {
                                setState(() {
                                  _value9 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value9,
                              onChanged: (value) {
                                setState(() {
                                  _value9 = value;
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
                      if (_value1 | _value2 | _value3 | _value4 != true ||
                          _value5 == null ||
                          _value6 == null ||
                          _value7 == null ||
                          _value8 == null ||
                          _value9 == null) {
                        Dialogs.alertToCompleteEvalutation(context);
                      } else {
                        Map<String, dynamic> formDataToDB = {
                          'Choice1': _value1,
                          'Choice2': _value2,
                          'Choice3': _value3,
                          'Choice4': _value4,
                          'Exercise1': _value5,
                          'Exercise2': _value6,
                          'Exercise3': _value7,
                          'Exercise4': _value8,
                          'Exercise5': _value9,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'BloodClot', data: formDataToDB);
                        if (_value1 == false &&
                            _value2 == false &&
                            _value3 == false &&
                            _value4 == true &&
                            _value5 == "10 ครั้ง/รอบ/ชั่วโมง" &&
                            _value6 == "10 ครั้ง/รอบ/ชั่วโมง" &&
                            _value7 == "10 ครั้ง/รอบ/ชั่วโมง" &&
                            _value8 == "5 ครั้ง/รอบ/ชั่วโมง" &&
                            _value9 == "5 ครั้ง/รอบ/ชั่วโมง") {
                          result = "Pass";
                          showAdvise1(context, result);
                        } else {
                          result = "NoPass";
                          showAdvise1(context, result);
                          var creation = _calculationService.formatDate(
                              date: DateTime.now());
                          var patientState = _anSubCollection['state'];
                          _firebaseService.addNotification({
                            'formName': 'BloodClot',
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
                        BloodclotsAdviceDay1(navigate: navigate)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("คำแนะนำการป้องกันการเกิดภาวะลิ่มเลือดอุดตัน",
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
