import 'package:flutter/material.dart';
import 'pre-op_page.dart';

class ADLForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ADLFormState();
  }
}

class _ADLFormState extends State<ADLForm> {
  String selectedChoice = '';
  String selectedChoice2 = '';
  String selectedChoice3 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'การปฏิบัติกิจวัตรประจำวัน',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          tooltip: 'กลับ',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PreOpPage()),
            );
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
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
                      children: [
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'รับประทานอาหารเมื่อเตรียมสำรับไว้ให้เรียบร้อยต่อหน้า',
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
                                  "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้"),
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
                        selected: selectedChoice ==
                            "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้",
                        onSelected: (selected) {
                          setState(() {
                            selectedChoice =
                                "ไม่สามารถตักอาหารเข้าปากได้ ต้องมีคนป้อนให้";
                            print(selectedChoice);
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
                                  "ตักอาหารเองได้แต่ต้องมีคนช่วย เช่น ช่วยใช้"),
                              Text(
                                  'ช้อนตักเตรียมไว้ให้หรือตัดเป็นเล็กๆไว้ล่วงหน้า')
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
                            selectedChoice == "ตักอาหารเองได้แต่ต้องมีคนช่วย",
                        onSelected: (selected) {
                          setState(() {
                            selectedChoice = "ตักอาหารเองได้แต่ต้องมีคนช่วย";
                            print(selectedChoice);
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
                        selected: selectedChoice ==
                            "ตักอาหารและช่วยตัวเองได้เป็นปกติ",
                        onSelected: (selected) {
                          setState(() {
                            selectedChoice = "ตักอาหารและช่วยตัวเองได้เป็นปกติ";
                            print(selectedChoice);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            'ล้างหน้า หวีผม แปรงฟัน โกนหนวด ในระยะเวลา 24 - 28 ชั่วโมงที่ผ่านมา',
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
                              Text(
                                  "ทำเองได้(รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)"),
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
                            "ทำเองได้(รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)",
                        onSelected: (selected2) {
                          setState(() {
                            selectedChoice2 =
                                "ทำเองได้(รวมทั้งที่ทำได้เองถ้าเตรียมอุปกรณ์ไว้ให้)";
                            print(selectedChoice2);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Card(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  "ต้องการความช่วยเหลือบ้างเช่น ช่วยพยุงเล็กน้อย"),
                              Text('หรือต้องมีคนดูแลเพื่อความปลอดภัย')
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
                            selectedChoice3 =
                                "ต้องการความช่วยเหลือบ้างเช่น ช่วยพยุงเล็กน้อย";
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
                            selectedChoice3 = "ทำเองได้";
                            print(selected3);
                            print(selectedChoice);
                            print(selectedChoice2);
                            print(selectedChoice3);
                            print(selected3);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
