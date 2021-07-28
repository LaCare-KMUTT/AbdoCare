import 'package:AbdoCare/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'set_pin_page.dart';

enum Consent { consent, notConsent, defaultValue }

class ConsentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ConsentPageState();
}

class _ConsentPageState extends State<ConsentPage> {
  Consent _result = Consent.defaultValue;
  String consentText =
      """ข้าพเจ้ายินดีเจ้าร่วมโครงการวิจัยโดยสมัครใจภายหลังจาหที่ข้าพเจ้าได้รับคำชี้แจงเอกสารข้อมูลสำหรับผู้เข้าร่วมโครงการวิจัย พร้อมด้วยการอธิบายจากผู้วัจัยถึงวัตถุประสงค์ของการวิจัย ระยะเวลาของการทำวิจัย วิธีการวิจัย อันตราย หรืออาการที่อาจจะเกิดขึ้นจากการวิจัยอย่างละเอียด โดยจะได้รับข้อมูลเป็นแนวปฏิบัติเพื่อการฟื้นสภาพหลังผ่าตัดตั้งแต่การเตรียมความพร้อมก่อนการผ่าตัดจนถึงหลังผ่าตัด""";
  String consentText2 =
      """ทั้งนี้ข้าพเจ้ามีสิทธิที่จะบอกเลิกเข้าร่วมในโครงการวิจัยเมื่อใดก็ได้ โดยไม่จำเป็นต้องแจ้งเหตุผล และการบอกเลิกการเข้าร่วมวิจับนี้ จะไม่มีผลต่อการรักษาโรคหรือสิทธิอื่นๆ ที่ข้าพเจ้าจะพึงได้รับต่อไป นอกจากนี้ผู้วิจัยรับรองว่าจะเก็บข้อมูลส่วนตัวของข้าพเจ้าเป็นความลับ และจะเปิดเผยได้เฉพาะเมื่อได้รับการยินยอมจากข้าพเจ้าเท่านั้น""";
  String selectedChoice = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'ความยินยอม',
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Card(
                  shadowColor: Color(0xFFC37447),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            """\t\t\t\t\t$consentText\n\n\t\t\t\t\t$consentText2""",
                            style: Theme.of(context).textTheme.bodyText1),
                      )
                    ],
                  ),
                ),
              ),
              RadioListTile(
                  title: Text("ยินยอม"),
                  value: Consent.consent,
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  }),
              RadioListTile(
                  title: Text("ไม่ยินยอม"),
                  value: Consent.notConsent,
                  groupValue: _result,
                  onChanged: (value) {
                    setState(() {
                      _result = value;
                    });
                  })
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: _result == Consent.consent
            ? Theme.of(context).primaryColor
            : Colors.grey[300],
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  onPrimary: Colors.white,
                  primary: _result == Consent.consent
                      ? Theme.of(context).primaryColor
                      : Colors.grey[300]),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ต่อไป',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 30.0)
                  ],
                ),
              ),
              onPressed: () {
                if (_result == Consent.consent) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SetPinPage()));
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
