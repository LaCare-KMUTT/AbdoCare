import 'package:flutter/material.dart';
import '../../../services/interfaces/firebase_service_interface.dart';
import '../../../services/service_locator.dart';
import '../../shared/alert_style.dart';

class ADLForm extends StatefulWidget {
  final String navigate;
  ADLForm({Key key, @required this.navigate}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ADLFormState();
  }
}

class _ADLFormState extends State<ADLForm> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  int totalscore = 0;
  int score1,
      score2,
      score3,
      score4,
      score5,
      score6,
      score7,
      score8,
      score9,
      score10 = 0;
  String selectedChoice1 = '';
  String selectedChoice2 = '';
  String selectedChoice3 = '';
  String selectedChoice4 = '';
  String selectedChoice5 = '';
  String selectedChoice6 = '';
  String selectedChoice7 = '';
  String selectedChoice8 = '';
  String selectedChoice9 = '';
  String selectedChoice10 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'การปฏิบัติกิจวัตรประจำวัน',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'กลับ',
          onPressed: () {
            if (widget.navigate == "Evaluate") {
              Navigator.pushNamed(context, '/evaluation_page');
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            /**********************Question 1***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 1 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Feeding.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 1',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Feeding',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              '''รับประทานอาหารเมื่อเตรียมสำรับไว้ให้เรียบร้อยต่อหน้า''',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    """ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้"""),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice1 ==
                              "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้",
                          onSelected: (selected1) {
                            setState(() {
                              score1 = 0;
                              selectedChoice1 =
                                  "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้";
                              print(selectedChoice1);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    '''ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้'''),
                                Text(
                                    '''ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า''')
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice1 ==
                              "ตักอาหารเองได้แต่ต้องมีคนช่วย",
                          onSelected: (selected1) {
                            setState(() {
                              score1 = 1;
                              selectedChoice1 = "ตักอาหารเองได้แต่ต้องมีคนช่วย";
                              print(selectedChoice1);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ตักอาหารและช่วยตัวเองได้เป็นปกติ"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice1 ==
                              "ตักอาหารและช่วยตัวเองได้เป็นปกติ",
                          onSelected: (selected1) {
                            setState(() {
                              score1 = 2;
                              selectedChoice1 =
                                  "ตักอาหารและช่วยตัวเองได้เป็นปกติ";
                              print(selectedChoice1);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 2***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 2 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Grooming.png',
                        height: 150,
                        width: 350,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 2',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Grooming',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              '''ล้างหน้า หวีผม แปรงฟัน โกนหนวด ในระยะเวลา 24 - 28 ชั่วโมงที่ผ่านมา''',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ต้องการความช่วยเหลือ"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice2 == "ต้องการความช่วยเหลือ",
                          onSelected: (selected2) {
                            setState(() {
                              score2 = 0;
                              selectedChoice2 = "ต้องการความช่วยเหลือ";
                              print(selectedChoice2);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ทำเองได้"),
                                Text(
                                    '''(รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)'''),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice2 ==
                              '''ทำเองได้(รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)''',
                          onSelected: (selected2) {
                            setState(() {
                              score2 = 1;
                              selectedChoice2 =
                                  '''ทำเองได้(รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)''';
                              print(selectedChoice2);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 3***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 3 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Transfer.png',
                        height: 150,
                        width: 300,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 3',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Tranfer',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'ลุกนั่งจากที่นอน หรือจากเตียงไปยังเก้าอี้',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ไม่สามารถนั่งได้ (นั่งแล้วจะล้มเสมอ)"),
                                Text("หรือต้องใช้คนสองคนช่วยกันยกขึ้น"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice3 ==
                              "ไม่สามารถนั่งได้ (นั่งแล้วจะล้มเสมอ)",
                          onSelected: (selected3) {
                            setState(() {
                              score3 = 0;
                              selectedChoice3 =
                                  "ไม่สามารถนั่งได้ (นั่งแล้วจะล้มเสมอ)";
                              print(selectedChoice3);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "ต้องการความช่วยเหลืออย่างมากจึงจะนั่งได้"),
                                Text(
                                    """เช่นต้องช่วยพยุงหรือดันขึ้นมาจึงจะนั่งอยู่ได้"""),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF69E51),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFFEBDA),
                          selected: selectedChoice3 ==
                              "ต้องการความช่วยเหลืออย่างมากจึงจะนั่งได้",
                          onSelected: (selected3) {
                            setState(() {
                              score3 = 1;
                              selectedChoice3 =
                                  "ต้องการความช่วยเหลืออย่างมากจึงจะนั่งได้";
                              print(selectedChoice3);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ต้องการความช่วยเหลือบ้างเช่น ช่วยพยุง"),
                                Text('เล็กน้อยหรือต้องมีคนดูแลเพื่อความปลอดภัย')
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice3 ==
                              "ต้องการความช่วยเหลือบ้างเช่น ช่วยพยุงเล็กน้อย",
                          onSelected: (selected3) {
                            setState(() {
                              score3 = 2;
                              selectedChoice3 =
                                  """ต้องการความช่วยเหลือบ้างเช่น ช่วยพยุงเล็กน้อย""";
                              print(selectedChoice3);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ทำเองได้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice3 == "ทำเองได้",
                          onSelected: (selected3) {
                            setState(() {
                              score3 = 3;
                              selectedChoice3 = "ทำเองได้";
                              print(selectedChoice3);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 4***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 4 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Toilet.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 4',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Toilet',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การใช้ห้องน้ำ',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ช่วยตัวเองไม่ได้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice4 == "ช่วยตัวเองไม่ได้",
                          onSelected: (selected4) {
                            setState(() {
                              score4 = 0;
                              selectedChoice4 = "ช่วยตัวเองไม่ได้";
                              print(selectedChoice4);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ทำเองได้บ้าง"),
                                Text('แต่ต้องการความช่วยเหลือในบางสิ่ง')
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice4 == "ทำเองได้บ้าง",
                          onSelected: (selected4) {
                            setState(() {
                              score4 = 1;
                              selectedChoice4 = "ทำเองได้บ้าง";
                              print(selectedChoice4);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    """ช่วยตัวเองได้ดี ขึ้นนั่งและลงจากโถส้วมเองได้"""),
                                Text("ทำความสะอาดได้เรียบร้อยหลังจากเสร็จธุระ")
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice4 == "ช่วยตัวเองได้ดี",
                          onSelected: (selected4) {
                            setState(() {
                              score4 = 2;
                              selectedChoice4 = "ช่วยตัวเองได้ดี";
                              print(selectedChoice4);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 5***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 5 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Mobility.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 5',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Mobility',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การเคลื่อนที่ภายในห้องหรือบ้าน',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("เคลื่อนที่ไปไหนไม่ได้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice5 == "เคลื่อนที่ไปไหนไม่ได้",
                          onSelected: (selected5) {
                            setState(() {
                              score5 = 0;
                              selectedChoice5 = "เคลื่อนที่ไปไหนไม่ได้";
                              print(selectedChoice5);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    """ต้องใช้รถเข็นช่วยตัวเองให้เคลื่อนที่ได้เอง"""),
                                Text('และจะต้องเข้าออกมุมห้องหรือประตูได้')
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xffF69E51),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFFEBDA),
                          selected: selectedChoice5 ==
                              "ต้องใช้รถเข็นช่วยตัวเองให้เคลื่อนที่ได้เอง",
                          onSelected: (selected5) {
                            setState(() {
                              score5 = 1;
                              selectedChoice5 =
                                  "ต้องใช้รถเข็นช่วยตัวเองให้เคลื่อนที่ได้เอง";
                              print(selectedChoice5);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("เดินหรือเคลื่อนที่โดยมีคนช่วย เช่น พยุง"),
                                Text("หรือต้องให้ความสนใจดูแลเพื่อความปลอดภัย")
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice5 ==
                              "เดินหรือเคลื่อนที่โดยมีคนช่วย",
                          onSelected: (selected5) {
                            setState(() {
                              score5 = 2;
                              selectedChoice5 = "เดินหรือเคลื่อนที่โดยมีคนช่วย";
                              print(selectedChoice5);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("เดินหรือเคลื่อนที่ได้เอง")],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected:
                              selectedChoice5 == "เดินหรือเคลื่อนที่ได้เอง",
                          onSelected: (selected5) {
                            setState(() {
                              score5 = 3;
                              selectedChoice5 = "เดินหรือเคลื่อนที่ได้เอง";
                              print(selectedChoice5);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 6***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 6 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Dressing.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 6',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Dressing',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การสวมใส่เสื้อผ้า',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ต้องมีคนสวมใส่ให้"),
                                Text('ช่วยตัวเองแทบไม่ได้หรือได้น้อย'),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice6 == "ต้องมีคนสวมใส่ให้",
                          onSelected: (selected6) {
                            setState(() {
                              score6 = 0;
                              selectedChoice6 = "ต้องมีคนสวมใส่ให้";
                              print(selectedChoice6);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ช่วยตัวเองได้ประมาณร้อยละ50"),
                                Text('ที่เหลือต้องมีคนช่วย')
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected:
                              selectedChoice6 == "ช่วยตัวเองได้ประมาณร้อยละ50",
                          onSelected: (selected6) {
                            setState(() {
                              score6 = 1;
                              selectedChoice6 = "ช่วยตัวเองได้ประมาณร้อยละ50";
                              print(selectedChoice6);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    """ช่วยตัวเองได้ดี (รวมทั้งการติดกระดุม รูดซิบ"""),
                                Text(
                                    "หรือใช้เสื้อผ้าที่ดัดแปลงให้เหมาะสมก็ได้)")
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice6 == "ช่วยตัวเองได้ดี",
                          onSelected: (selected6) {
                            setState(() {
                              score6 = 2;
                              selectedChoice6 = "ช่วยตัวเองได้ดี";
                              print(selectedChoice6);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 7***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 7 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Stairs.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 7',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Stairs',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การขึ้นลงบันได 1 ชั้น',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ไม่สามารถทำได้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice7 == "ไม่สามารถทำได้",
                          onSelected: (selected7) {
                            setState(() {
                              score7 = 0;
                              selectedChoice7 = "ไม่สามารถทำได้";
                              print(selectedChoice7);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ต้องการคนช่วย"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice7 == "ต้องการคนช่วย",
                          onSelected: (selected7) {
                            setState(() {
                              score7 = 1;
                              selectedChoice7 = "ต้องการคนช่วย";
                              print(selectedChoice7);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ขึ้นลงได้เอง (ถ้าต้องใช้เครื่องช่วยเดิน"),
                                Text("เช่น walkerจะต้องเอาขึ้นลงได้ด้วย)")
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice7 == "ขึ้นลงได้เอง",
                          onSelected: (selected7) {
                            setState(() {
                              score7 = 2;
                              selectedChoice7 = "ขึ้นลงได้เอง";
                              print(selectedChoice7);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 8***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 8 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Bathing.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 8',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Bathing',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การอาบน้ำ',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ต้องมีคนช่วยหรือทำให้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice8 == "ต้องมีคนช่วยหรือทำให้",
                          onSelected: (selected8) {
                            setState(() {
                              score8 = 0;
                              selectedChoice8 = "ต้องมีคนช่วยหรือทำให้";
                              print(selectedChoice8);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("อาบน้ำเองได้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice8 == "อาบน้ำเองได้",
                          onSelected: (selected8) {
                            setState(() {
                              score8 = 1;
                              selectedChoice8 = "อาบน้ำเองได้";
                              print(selectedChoice8);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 9***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 9 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Bowels.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 9',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Bowels',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การกลั้นการถ่ายอุจจาระในระยะ1สัปดาห์ที่ผ่านมา',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    """กลั้นไม่ได้ หรือต้องการการสวนอุจจาระอยู่เสมอ"""),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice9 ==
                              "กลั้นไม่ได้ หรือต้องการการสวนอุจจาระอยู่เสมอ",
                          onSelected: (selected9) {
                            setState(() {
                              score9 = 0;
                              selectedChoice9 =
                                  """กลั้นไม่ได้ หรือต้องการการสวนอุจจาระอยู่เสมอ""";
                              print(selectedChoice9);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("กลั้นไม่ได้บางครั้ง"),
                                Text("(เป็นน้อยกว่า1ครั้งต่อสัปดาห์)")
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice9 == "กลั้นไม่ได้บางครั้ง",
                          onSelected: (selected9) {
                            setState(() {
                              score9 = 1;
                              selectedChoice9 = "กลั้นไม่ได้บางครั้ง";
                              print(selectedChoice9);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("กลั้นได้เป็นปกติ"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice9 == "กลั้นได้เป็นปกติ",
                          onSelected: (selected9) {
                            setState(() {
                              score9 = 2;
                              selectedChoice9 = "กลั้นได้เป็นปกติ";
                              print(selectedChoice9);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /**********************Question 10***********************/
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'ข้อที่ 10 จากทั้งหมด 10 ข้อ',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/icon/Bladder.png',
                        height: 150,
                        width: 150,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text('คำถามที่ 10',
                                style: Theme.of(context).textTheme.bodyText2),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'Bladder',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              'การกลั้นปัสสาวะในระยะ1สัปดาห์ที่ผ่านมา',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("กลั้นไม่ได้ หรือใส่สายสวนปัสสาวะ"),
                                Text("แต่ไม่สามารถดูแลเองได้"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFCE9E9),
                          selected: selectedChoice10 ==
                              "กลั้นไม่ได้ หรือใส่สายสวนปัสสาวะ",
                          onSelected: (selected10) {
                            setState(() {
                              score10 = 0;
                              selectedChoice10 =
                                  "กลั้นไม่ได้ หรือใส่สายสวนปัสสาวะ";
                              print(selectedChoice10);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    """กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่าวันละ1ครั้ง)"""),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color(0xffF2C94C),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffFDF4D7),
                          selected: selectedChoice10 ==
                              "กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่าวันละ1ครั้ง)",
                          onSelected: (selected10) {
                            setState(() {
                              score10 = 1;
                              selectedChoice10 =
                                  """กลั้นไม่ได้บางครั้ง (เป็นน้อยกว่าวันละ1ครั้ง)""";
                              print(selectedChoice10);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: ChoiceChip(
                          label: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("กลั้นได้เป็นปกติ"),
                              ],
                            ),
                          ),
                          labelStyle: Theme.of(context).textTheme.bodyText1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color(0xff6FCF97),
                              )),
                          backgroundColor: Colors.white,
                          selectedColor: Color(0xffE5FBEE),
                          selected: selectedChoice10 == "กลั้นได้เป็นปกติ",
                          onSelected: (selected10) {
                            setState(() {
                              score10 = 2;
                              selectedChoice10 = "กลั้นได้เป็นปกติ";
                              print(selectedChoice10);
                            });
                          },
                        ),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2ED47A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                    onPressed: () {
                      if (selectedChoice1 == "" ||
                          selectedChoice2 == "" ||
                          selectedChoice3 == "" ||
                          selectedChoice4 == "" ||
                          selectedChoice5 == "" ||
                          selectedChoice6 == "" ||
                          selectedChoice7 == "" ||
                          selectedChoice8 == "" ||
                          selectedChoice9 == "" ||
                          selectedChoice10 == "") {
                        Dialogs.alertToCompleteEvalutation(context);
                      } else {
                        totalscore = score1 +
                            score2 +
                            score3 +
                            score4 +
                            score5 +
                            score6 +
                            score7 +
                            score8 +
                            score9 +
                            score10;
                        ;
                        Map<String, dynamic> formDataToDB = {
                          'Feeding': score1,
                          'Grooming': score2,
                          'Transfer': score3,
                          'Toilet': score4,
                          'Mobility': score5,
                          'Dressing': score6,
                          'Stairs': score7,
                          'Bathing': score8,
                          'Bowels': score9,
                          'Bladder': score10,
                          'TotalScoreADL': totalscore,
                        };
                        _firebaseService.addDataToFormsCollection(
                            formName: 'ADL', data: formDataToDB);
                        showAlertDialog(context, totalscore);
                      }
                    },
                    child: Text('สำเร็จ',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, int total) {
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
                if (total >= 12) {
                  return Column(
                    children: [
                      Text("คะแนนรวม = $total"),
                      Text("Mild independence",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  );
                } else if (total >= 9) {
                  return Column(
                    children: [
                      Text("คะแนนรวม = $total"),
                      Text("Moderately independence",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  );
                } else if (total >= 5) {
                  return Column(
                    children: [
                      Text("คะแนนรวม = $total"),
                      Text("severe independence",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Text("คะแนนรวม = $total"),
                      Text("ผู้ป่วยไม่ผ่านแบบประเมิน",
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  );
                }
              }()),
            ],
          ),
        ),
      ],
    ),
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFC37447),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
