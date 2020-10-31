import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFC37447),
        title: Text('ข้อมูลส่วนตัว'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'ชื่อ-นามสกุล',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('นางสาวพรพิมล แก้วใส', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'เพศ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('หญิง', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'อายุ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('22 ปี', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'วิธีการผ่าตัด',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('ผ่าตัดแบบส่องกล้อง', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'เบอร์โทรศัพท์',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'xxx-xxx-xxxx',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'น้ำหนัก',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '60',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'ส่วนสูง',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: '160',
                      border: UnderlineInputBorder(),
                      contentPadding: EdgeInsets.all(5.0),
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 0, top: 10.0),
                child: Text(
                  'BMI ค่าดัชนีมวลกาย',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Color(0xFFC37447)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('23.44 (ท้วม)', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xFFE38C14),
                  child: Text('ตั้งค่ารหัสผ่านยืนยันตัวตน 6 หลัก',
                      style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    print('This is setpin button');
                    setState(() {});
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SetpinRoute()),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Color(0xFF33cc33),
                  child: Text('ยืนยัน', style: TextStyle(fontSize: 18)),
                  onPressed: () {
                    print('This is setpin button');
                    setState(() {});
                    Navigator.pushReplacementNamed(context, '/chat_page');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SetpinRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SetpinRouteState();
}

class _SetpinRouteState extends State<SetpinRoute> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFC37447), Color(0xFFC37447)],
              begin: Alignment.bottomCenter,
            ),
          ),
          child: PinScreen(),
        ),
      );
}

class PinScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  List<String> currentPin = ["", "", "", "", "", ""];
  TextEditingController pinOneController = TextEditingController();
  TextEditingController pinTwoController = TextEditingController();
  TextEditingController pinThreeController = TextEditingController();
  TextEditingController pinFourController = TextEditingController();
  TextEditingController pinFiveController = TextEditingController();
  TextEditingController pinSixController = TextEditingController();
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(
      color: Color(0xFFC37447),
    ),
  );
  int pinIndex = 0;
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment(0, 0.5),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    buildSecurityText(),
                    SizedBox(height: 40.0),
                    buildPinRow(),
                  ],
                ),
              ),
            ),
            buildNumberPad(),
          ],
        ),
      );

  // ignore: type_annotate_public_apis
  buildNumberPad() => Expanded(
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      n: 1,
                      onPressed: () {
                        pinIndexSetup("1");
                      },
                    ),
                    KeyboardNumber(
                      n: 2,
                      onPressed: () {
                        pinIndexSetup("2");
                      },
                    ),
                    KeyboardNumber(
                      n: 3,
                      onPressed: () {
                        pinIndexSetup("3");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      n: 4,
                      onPressed: () {
                        pinIndexSetup("4");
                      },
                    ),
                    KeyboardNumber(
                      n: 5,
                      onPressed: () {
                        pinIndexSetup("5");
                      },
                    ),
                    KeyboardNumber(
                      n: 6,
                      onPressed: () {
                        pinIndexSetup("6");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    KeyboardNumber(
                      n: 7,
                      onPressed: () {
                        pinIndexSetup("7");
                      },
                    ),
                    KeyboardNumber(
                      n: 8,
                      onPressed: () {
                        pinIndexSetup("8");
                      },
                    ),
                    KeyboardNumber(
                      n: 9,
                      onPressed: () {
                        pinIndexSetup("9");
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        onPressed: null,
                        child: SizedBox(),
                      ),
                    ),
                    KeyboardNumber(
                      n: 0,
                      onPressed: () {
                        pinIndexSetup("0");
                      },
                    ),
                    Container(
                      width: 60.0,
                      child: MaterialButton(
                        height: 60.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60.0),
                        ),
                        onPressed: () {
                          clearPin();
                        },
                        child:
                            Icon(Icons.backspace_outlined, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  // ignore: type_annotate_public_apis
  clearPin() {
    if (pinIndex == 0) {
      pinIndex = 0;
    } else if (pinIndex == 6) {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    } else {
      setPin(pinIndex, "");
      currentPin[pinIndex - 1] = "";
      pinIndex--;
    }
  }

  // ignore: type_annotate_public_apis
  pinIndexSetup(String text) {
    if (pinIndex == 0) {
      pinIndex = 1;
    } else if (pinIndex < 6) pinIndex++;
    setPin(pinIndex, text);
    currentPin[pinIndex - 1] = text;
    var strPin = "";
    // ignore: avoid_function_literals_in_foreach_calls
    currentPin.forEach((element) {
      strPin += element;
    });
    if (pinIndex == 6) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "ยืนยันรหัสผ่าน",
        //desc: "Flutter is more awesome with RFlutter Alert.",
        buttons: [
          DialogButton(
            child: Text(
              "ยกเลิก",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromRGBO(255, 49, 0, 1.0),
          ),
          DialogButton(
            child: Text(
              "ยืนยัน",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              print(strPin);
              Navigator.pushReplacementNamed(context, '/profile_page');
            },
            color: Color.fromRGBO(0, 179, 134, 1.0),
          )
        ],
      ).show();
    }
  }

  // ignore: type_annotate_public_apis
  setPin(int n, String text) {
    switch (n) {
      case 1:
        pinOneController.text = text;
        break;
      case 2:
        pinTwoController.text = text;
        break;
      case 3:
        pinThreeController.text = text;
        break;
      case 4:
        pinFourController.text = text;
        break;
      case 5:
        pinFiveController.text = text;
        break;
      case 6:
        pinSixController.text = text;
        break;
    }
  }

  // ignore: type_annotate_public_apis
  buildPinRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinOneController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinTwoController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinThreeController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFourController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinFiveController,
          ),
          PINNumber(
            outlineInputBorder: outlineInputBorder,
            textEditingController: pinSixController,
          ),
        ],
      );

  // ignore: type_annotate_public_apis
  buildSecurityText() => Text(
        "ตั้งค่ารหัสผ่านใหม่",
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      );
}

class PINNumber extends StatelessWidget {
  final TextEditingController textEditingController;
  final OutlineInputBorder outlineInputBorder;
  PINNumber({this.textEditingController, this.outlineInputBorder});

  @override
  Widget build(BuildContext context) => Container(
        width: 50.0,
        height: 100.0,
        child: TextField(
          controller: textEditingController,
          enabled: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
            border: outlineInputBorder,
            filled: true,
            fillColor: Colors.white24,
          ),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
      );
}

class KeyboardNumber extends StatelessWidget {
  final int n;
  final Function() onPressed;
  KeyboardNumber({this.n, this.onPressed});
  @override
  Widget build(BuildContext context) => Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFC37447).withOpacity(0.1),
        ),
        alignment: Alignment.center,
        child: MaterialButton(
          padding: EdgeInsets.all(8.0),
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          height: 90.0,
          child: Text(
            "$n",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
