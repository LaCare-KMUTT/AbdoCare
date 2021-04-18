import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';

class UrologyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UrologyFormState();
}

class _UrologyFormState extends State<UrologyForm> {
  var _value1;
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
        title: Text('ระบบปัสสาวะ'),
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
                        Text(
                            '''ทำเครื่องหมาย √ ตามความเป็นจริง\n\tภายใน 6-8 ชั่วโมงหลังการผ่าตัด'''),
                        Row(
                          children: [
                            Text(
                              '''ประเมินระบบปัสสาวะ''',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        ListTile(
                          title: const Text('ถ่ายปัสสาวะแล้ว'),
                          leading: Radio(
                              value: 'ถ่ายปัสสาวะแล้ว',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text('ยังไม่ถ่ายปัสสาวะ'),
                          leading: Radio(
                              value: 'ยังไม่ถ่ายปัสสาวะ',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: const Text(
                              '''ปวดปัสสาวะแต่ถ่ายไม่ออก ต้องการความช่วยเหลือจากเจ้าหน้าที่'''),
                          leading: Radio(
                              value:
                                  '''ปวดปัสสาวะแต่ถ่ายไม่ออก ต้องการความช่วยเหลือจากเจ้าหน้าที่''',
                              activeColor: Color(0xFFC37447),
                              groupValue: _value1,
                              onChanged: (value) {
                                setState(() {
                                  _value1 = value;
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
                      if (_value1 == null) {
                        Dialogs.alertToCompleteEvalutation(context);
                      } else {
                        Map<String, dynamic> formDataToDB = {
                          'Exercise1': _value1,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'Urology', data: formDataToDB);
                        if (_value1 == "ถ่ายปัสสาวะแล้ว") {
                          result = "Pass";
                          showAdvise1(context, result);
                        } else {
                          result = "NoPass";
                          showAdvise1(context, result);
                          var creation = _calculationService.formatDate(
                              date: DateTime.now());
                          var patientState = _anSubCollection['state'];
                          _firebaseService.addNotification({
                            'formName': 'Urology',
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
