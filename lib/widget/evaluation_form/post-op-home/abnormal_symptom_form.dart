import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../shared/alert_style.dart';

class AbnormalSymptomForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AbnormalSymptomFormState();
}

class _AbnormalSymptomFormState extends State<AbnormalSymptomForm> {
  var _value = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;
  var _value5 = false;

  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('อาการแสดงที่ผิดปกติ'),
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
                    CheckboxListTile(
                      value: _value,
                      selected: _value,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _value5 = false;
                        });
                      },
                      title: Text('1. ปวดแผลมากขึ้นกว่าวันที่ออกจากโรงพยาบาล'),
                    ),
                    CheckboxListTile(
                      value: _value2,
                      selected: _value2,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value2 = value;
                          _value5 = false;
                        });
                      },
                      title: Text('2. ปวดท้องมาก'),
                    ),
                    CheckboxListTile(
                      value: _value3,
                      selected: _value3,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value3 = value;
                          _value5 = false;
                        });
                      },
                      title: Text('3. แผลผ่าตัดบวมมาก'),
                    ),
                    CheckboxListTile(
                      value: _value4,
                      selected: _value4,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value4 = value;
                          _value5 = false;
                        });
                      },
                      title: Text('4. มีหนองไหลจากแผลผ่าตัด'),
                    ),
                    CheckboxListTile(
                      value: _value5,
                      selected: _value5,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: Color(0xFFC37447),
                      onChanged: (value) {
                        setState(() {
                          _value5 = value;
                          _value = false;
                          _value2 = false;
                          _value3 = false;
                          _value4 = false;
                        });
                      },
                      title: Text('5. ไม่มีอาการตามที่กล่าวมา'),
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
                    onPressed: () {
                      Map<String, dynamic> formDataToDB = {
                        'Choice1': _value,
                        'Choice2': _value2,
                        'Choice3': _value3,
                        'Choice4': _value4,
                        'Choice5': _value5,
                      };
                      if (_value | _value2 | _value3 | _value4 == true) {
                        _firebaseService.addDataToFormsCollection(
                            formName: 'Abnormal Symptom', data: formDataToDB);
                        showAdvise(context);
                      }
                      if (_value5 == true) {
                        _firebaseService.addDataToFormsCollection(
                            formName: 'Abnormal Symptom', data: formDataToDB);
                      } else if (_value |
                              _value2 |
                              _value3 |
                              _value4 |
                              _value5 !=
                          true) {
                        Dialogs.alertToCompleteEvalutation(context);
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showAdvise(BuildContext context) {
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("แจ้งเตือน", style: Theme.of(context).textTheme.bodyText2),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("ให้ผู้ป่วยมาพบแพทย์ทันที",
                    style: Theme.of(context).textTheme.bodyText1),
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
