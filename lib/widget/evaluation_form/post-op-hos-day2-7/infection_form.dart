import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../services/interfaces/calculation_service_interface.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../../stores/user_store.dart';
import '../../shared/alert_style.dart';
import '../../training_information/post-op-hos-day2-7/drain_secretion_advice.dart';

class InfectionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InfectionForm();
}

class _InfectionForm extends State<InfectionForm> {
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;
  var _value6 = false;
  var _value7 = false;
  var _value8 = false;
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
        title: Text('การเฝ้าระวังภาวะแทรกซ้อน'),
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
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Text('ทำเครื่องหมาย √ ในข้อที่ท่านมีอาการ'),
                    Row(
                      children: [
                        Text(
                          '1. การเฝ้าระวังการติดเชื้อที่แผลผ่าตัด',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    CheckboxListTile(
                      value: _value1,
                      selected: _value1,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value1 = value;
                          _value3 = false;
                        });
                      },
                      title: Text('1. แผลผ่าตัดบวมมาก'),
                    ),
                    CheckboxListTile(
                      value: _value2,
                      selected: _value2,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value2 = value;
                          _value3 = false;
                        });
                      },
                      title: Text('2. มีสิ่งคัดหลั่งออกจากแผลผ่าตัด'),
                    ),
                    CheckboxListTile(
                      value: _value3,
                      selected: _value3,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value3 = value;
                          _value1 = false;
                          _value2 = false;
                          _value4 = false;
                        });
                      },
                      title: Text('3. แผลผ่าตัดแห้งดี'),
                    ),
                    CheckboxListTile(
                      value: _value4,
                      selected: _value4,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value4 = value;
                          _value3 = false;
                        });
                      },
                      title: Text('4. ไม่แน่ใจ ต้องการให้พยาบาลประเมินแผล'),
                    ),
                    Row(
                      children: [
                        Text(
                          '2. ความผิดปกติของการระบายสิ่งคัดหลั่ง',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left,
                        ),
                      ],
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
                      title: Text('1. ท่อระบายอยู่ในตำแหน่งเหมาะสม'),
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
                      title: Text(
                          '2. กระเปาะแบน หรือ หัวจุกสีแดงยุบตัวติดกันตลอดเวลา'),
                    ),
                    CheckboxListTile(
                      value: _value7,
                      selected: _value7,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value7 = value;
                        });
                      },
                      title: Text(
                          '''3. มีสิ่งคัดหลั่งออกจากแผลรอบๆ ท่อระบาย หรือแผลบวมแดง'''),
                    ),
                    CheckboxListTile(
                      value: _value8,
                      selected: _value8,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value8 = value;
                        });
                      },
                      title:
                          Text('4. สีหรือปริมาณสิ่งคัดหลั่งผิดปกติไปจากเดิม'),
                    ),
                  ],
                ),
              ),
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
                              _value6 |
                              _value7 |
                              _value8 !=
                          true) {
                        Dialogs.alertToCompleteEvalutation(context);
                      } else {
                        Map<String, dynamic> formDataToDB = {
                          'Choice1': _value1,
                          'Choice2': _value2,
                          'Choice3': _value3,
                          'Choice4': _value4,
                          'Choice5': _value5,
                          'Choice6': _value6,
                          'Choice7': _value7,
                          'Choice8': _value8,
                        };
                        var formId =
                            await _firebaseService.addDataToFormsCollection(
                                formName: 'Infection', data: formDataToDB);
                        if (_value3 == true &&
                            (_value5 || _value6 == true) &&
                            _value7 == false &&
                            _value8 == false) {
                          result = "Pass";
                          showAdvise1(context, result);
                        } else {
                          result = "NoPass";
                          showAdvise1(context, result);
                          var creation = _calculationService.formatDate(
                              date: DateTime.now());
                          var patientState = _anSubCollection['state'];
                          _firebaseService.addNotification({
                            'formName': 'Infection',
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
                        DrainSecretionAdviceDay2(navigate: navigate)));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("คำแนะนำการเฝ้าระวังการติดเชื้อที่แผลผ่าตัด",
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
