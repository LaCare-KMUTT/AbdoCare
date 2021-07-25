import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../models/login_model.dart';
import '../services/service_locator.dart';
import '../ultilities/form_utility/format_text.dart';
import '../widget/shared/alert_style.dart';
import 'consent_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _uniqueKeycontroller = TextEditingController();
  final _hnController = TextEditingController();
  final LoginModel _loginModel = locator<LoginModel>();
  final bool _validateHN = false;
  final bool _validateUniqueKey = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'AbdoCare',
        ),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 50, 50, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/abdocare_logo.png',
                        height: 200,
                        width: 200,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                controller: _hnController,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'หมายเลขผู้ป่วยนอก(HN)',
                  errorText:
                      _validateHN ? 'กรุณาใส่หมายเลขผู้ป่วยนอก(HN)' : null,
                ),
                inputFormatters: [UpperCaseText()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: TextField(
                controller: _uniqueKeycontroller,
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'รหัสโค้ด',
                  errorText:
                      _validateUniqueKey ? 'กรุณาใส่รหัสโค้ด 6 หลัก' : null,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, screenSize.height / 6),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0)),
                        onPrimary: Colors.white,
                        primary: Color(0xFF2ED47A),
                      ),
                      child: Text('ลงทะเบียน',
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                      onPressed: () async {
                        _loginModel.hn = _hnController.text.trim();
                        _loginModel.password = _uniqueKeycontroller.text.trim();
                        _loginModel.checkHn();
                        _loginModel.checkUniqueKey();
                        if (!_loginModel.validateHn &&
                            !_loginModel.validateUniqueKey) {
                          if (await _loginModel.signIn()) {
                            print("login success!");
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConsentPage()),
                            );
                          }
                        } else {
                          print('login failed');
                          _showErrorSignInDialog(context);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showErrorSignInDialog(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.warning,
    style: alertStyle,
    title: "ขออภัยค่ะ",
    content: Text(
      'ไม่สามารถลงทะเบียนได้เนื่องจากท่านกรอกข้อมูลไม่ถูกต้องค่ะ',
      style: Theme.of(context).textTheme.bodyText1,
      textAlign: TextAlign.center,
    ),
    buttons: [
      DialogButton(
        child: Text(
          "ตกลง",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: Color(0xFFC37447),
      ),
    ],
  ).show();
}
