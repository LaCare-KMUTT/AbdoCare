import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';
import '../../training_information/post-op-hos-day2-7/digestive_rehabilitation_advice.dart';

class DigestiveForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DigestiveFormState();
}

class _DigestiveFormState extends State<DigestiveForm> {
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7;
  var _value8;
  var _value9;
  var _value10;
  var _value11;
  var _value12;
  var _value13;
  var _value14;
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
        title: Text('การฟื้นฟูระบบทางเดินอาหาร'),
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
                            });
                          },
                          title: Text('1. ผายลมแล้ว'),
                        ),
                        CheckboxListTile(
                          value: _value2,
                          selected: _value2,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value2 = value;
                            });
                          },
                          title: Text('2. ปวดท้อง'),
                        ),
                        CheckboxListTile(
                          value: _value3,
                          selected: _value3,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value3 = value;
                            });
                          },
                          title: Text('3. แน่นท้อง'),
                        ),
                        CheckboxListTile(
                          value: _value4,
                          selected: _value4,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value4 = value;
                            });
                          },
                          title: Text('4. รู้สึกท้องอืด'),
                        ),
                        CheckboxListTile(
                          value: _value5,
                          selected: _value5,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value5 = value;
                            });
                          },
                          title: Text('5. คลื่นไส้'),
                        ),
                        CheckboxListTile(
                          value: _value6,
                          selected: _value6,
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Color(0xFFC37447),
                          onChanged: (value) {
                            setState(() {
                              _value6 = value;
                            });
                          },
                          title: Text('6. อาเจียน'),
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
                                  "https://youtu.be/MB7NVIb-bck"),
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
                              'ท่าที่ 2 ข้อนิ้วเท้า',
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
                              'ท่าที่ 3 ข้อเข่า',
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
                        Row(
                          children: [
                            Text(
                              'ท่าที่ 4 ข้อเข่า',
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
                              groupValue: _value10,
                              onChanged: (value) {
                                setState(() {
                                  _value10 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 5 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value10,
                              onChanged: (value) {
                                setState(() {
                                  _value10 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value10,
                              onChanged: (value) {
                                setState(() {
                                  _value10 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'ท่าที่ 5 ข้อเข่า',
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
                              groupValue: _value11,
                              onChanged: (value) {
                                setState(() {
                                  _value11 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value11,
                              onChanged: (value) {
                                setState(() {
                                  _value11 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value11,
                              onChanged: (value) {
                                setState(() {
                                  _value11 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'ท่าที่ 6 กล้ามเนื้ออุ้งเชิงกราน',
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
                              groupValue: _value12,
                              onChanged: (value) {
                                setState(() {
                                  _value12 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง'),
                          leading: Radio(
                              value: 'น้อยกว่า 10 ครั้ง/รอบ/ชั่วโมง',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value12,
                              onChanged: (value) {
                                setState(() {
                                  _value12 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value12,
                              onChanged: (value) {
                                setState(() {
                                  _value12 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'การลุกออกจากเตียและเดินระยะทาง 5 เมตร',
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
                              groupValue: _value13,
                              onChanged: (value) {
                                setState(() {
                                  _value13 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value13,
                              onChanged: (value) {
                                setState(() {
                                  _value13 = value;
                                });
                              }),
                        ),
                        Row(
                          children: [
                            Text(
                              'การลุกออกจากเตียและเดินระยะทาง 10 เมตร',
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
                              groupValue: _value14,
                              onChanged: (value) {
                                setState(() {
                                  _value14 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ไม่ปฏิบัติ'),
                          leading: Radio(
                              value: 'ไม่ปฏิบัติ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value14,
                              onChanged: (value) {
                                setState(() {
                                  _value14 = value;
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
                      if (_value1 |
                                  _value2 |
                                  _value3 |
                                  _value4 |
                                  _value5 |
                                  _value6 !=
                              true ||
                          _value7 == null ||
                          _value8 == null ||
                          _value9 == null ||
                          _value10 == null ||
                          _value11 == null ||
                          _value12 == null ||
                          _value13 == null ||
                          _value14 == null) {
                        Dialogs.alertToCompleteEvalutation(context);
                      } else {
                        Map<String, dynamic> formDataToDB = {
                          'Choice1': _value1,
                          'Choice2': _value2,
                          'Choice3': _value3,
                          'Choice4': _value4,
                          'Choice5': _value5,
                          'Choice6': _value6,
                          'Exercise1': _value7,
                          'Exercise2': _value8,
                          'Exercise3': _value9,
                          'Exercise4': _value10,
                          'Exercise5': _value11,
                          'Exercise6': _value12,
                          'Exercise7': _value13,
                          'Exercise8': _value14,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'Digestive', data: formDataToDB);
                        if (_value1 == true &&
                            _value2 == false &&
                            _value3 == false &&
                            _value4 == false &&
                            _value5 == false &&
                            _value6 == false &&
                            _value7 == "10 ครั้ง/รอบ/ชั่วโมง" &&
                            _value8 == "5 ครั้ง/รอบ/ชั่วโมง" &&
                            _value9 == "5 ครั้ง/รอบ/ชั่วโมง" &&
                            _value10 == "5 ครั้ง/รอบ/ชั่วโมง" &&
                            _value11 == "10 ครั้ง/รอบ/ชั่วโมง" &&
                            _value12 == "10 ครั้ง/รอบ/ชั่วโมง" &&
                            _value13 == "ปฏิบัติ" &&
                            _value14 == "ปฏิบัติ") {
                          result = "Pass";
                          showAdvise1(context, result);
                        } else {
                          result = "NoPass";
                          showAdvise1(context, result);
                          var userId =
                              UserStore.getValueFromStore('storedUserId');
                          await _firebaseService.addNotification(
                              formId: formId,
                              formName: 'Digestive',
                              userId: userId);
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
                        DigestiveAdviceDay2(navigate: navigate)));
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
