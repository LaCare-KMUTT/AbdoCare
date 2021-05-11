import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../shared/loading_widget.dart';
import '../shared/material.dart';
import 'radial_gauge_chart.dart';

class ADLTable extends StatefulWidget {
  @override
  _ADLTableState createState() => _ADLTableState();
}

class _ADLTableState extends State<ADLTable> {
  final _firebaseService = locator<IFirebaseService>();
  final CustomMaterial _customMaterial = locator<CustomMaterial>();
  int score;
  String topic;
  Widget adlIcon(BuildContext context, String topic, int score) {
    Widget child;
    // For 2 choice
    if (topic == "Grooming" || topic == "Bathing") {
      if (score == 0) {
        child = Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size: 60,
        );
      } else if (score == 1) {
        child = Icon(
          Icons.sentiment_very_satisfied_outlined,
          color: Colors.green,
          size: 60,
        );
      } else {
        child = Icon(
          Icons.sentiment_satisfied,
          color: Colors.grey[350],
          size: 60,
        );
      }
    }
    // For 3 choice
    else if (topic == "Feeding" ||
        topic == "Toilet" ||
        topic == "Dressing" ||
        topic == "Stairs" ||
        topic == "Bowels" ||
        topic == "Bladder") {
      if (score == 0) {
        child = Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size: 60,
        );
      } else if (score == 1) {
        child = Icon(
          Icons.sentiment_satisfied_outlined,
          color: Colors.yellow[600],
          size: 60,
        );
      } else if (score == 2) {
        child = Icon(
          Icons.sentiment_very_satisfied_outlined,
          color: Colors.green,
          size: 60,
        );
      } else {
        child = Icon(
          Icons.sentiment_satisfied,
          color: Colors.grey[350],
          size: 60,
        );
      }
    }
    // For 4 choice
    else if (topic == "Transfer" || topic == "Mobility") {
      if (score == 0) {
        child = Icon(
          Icons.sentiment_very_dissatisfied,
          color: Colors.red,
          size: 60,
        );
      } else if (score == 1) {
        child = Icon(
          Icons.sentiment_satisfied,
          color: Colors.orange,
          size: 60,
        );
      } else if (score == 2) {
        child = Icon(
          Icons.sentiment_satisfied_outlined,
          color: Colors.yellow[600],
          size: 60,
        );
      } else if (score == 3) {
        child = Icon(
          Icons.sentiment_very_satisfied_outlined,
          color: Colors.green,
          size: 60,
        );
      } else {
        child = Icon(
          Icons.sentiment_satisfied,
          color: Colors.grey[350],
          size: 60,
        );
      }
    }
    return Container(child: child);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _firebaseService.getAdlTable(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return loadingProgress;
          }
          return Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                          child: Text(
                            '''ความสามารถในการปฏิบัติกิจวัตรประจำวัน''',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Table(
                            border: TableBorder.all(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1),
                            columnWidths: {
                              0: FractionColumnWidth(0.40),
                              1: FractionColumnWidth(0.20),
                              2: FractionColumnWidth(0.20),
                              3: FractionColumnWidth(0.20)
                            },
                            children: [
                              TableRow(children: [
                                Column(children: [
                                  Text(
                                    'หัวข้อ',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFC37447)),
                                  )
                                ]),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'ประเมินก่อนผ่าตัด',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFC37447)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'ประเมินหลังผ่าตัด',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFC37447)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    'ประเมินขณะพักฟื้นที่บ้าน',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xFFC37447)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Text("รับประทานอาหาร",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                      Image.asset(
                                        'assets/icon/Feeding.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Feeding",
                                        score = snap.data['PreOpFeeding'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Feeding",
                                        score = snap.data['PostHosFeeding'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Feeding",
                                        score = snap.data['PostHomeFeeding'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text("การล้างหน้า หวีผม แปรงฟัน โกนหนวด",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Grooming.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Grooming",
                                        snap.data['PreOpGrooming'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Grooming",
                                        score = snap.data['PostHosGrooming'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Grooming",
                                        score = snap.data['PostHomeGrooming'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text(
                                          '''การลุกนั่งจากที่นอนหรือเตียงไปยังเก้าอี้''',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Transfer.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Transfer",
                                        score = snap.data['PreOpTransfer'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Transfer",
                                        score = snap.data['PostHosTransfer'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Transfer",
                                        score = snap.data['PostHomeTransfer'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text("การใช้ห้องน้ำ",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Toilet.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Toilet",
                                        score = snap.data['PreOpToilet'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Toilet",
                                        score = snap.data['PostHosToilet'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Toilet",
                                        score = snap.data['PostHomeToilet'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text("การเคลื่อนที่ภายในห้องหรือบ้าน",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Mobility.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Mobility",
                                        score = snap.data['PreOpMobility'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Mobility",
                                        score = snap.data['PostHosMobility'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Mobility",
                                        score = snap.data['PostHomeMobility'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text("การสวมใส่เสื้อผ้า",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Dressing.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Dressing",
                                        score = snap.data['PreOpDressing'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Dressing",
                                        score = snap.data['PostHosDressing'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Dressing",
                                        score = snap.data['PostHomeDressing'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text("การขึ้นลงบันได 1 ชั้น",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Stairs.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Stairs",
                                        score = snap.data['PreOpStairs'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Stairs",
                                        score = snap.data['PostHosStairs'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Stairs",
                                        score = snap.data['PostHomeStairs'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text("การอาบน้ำ",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                          textAlign: TextAlign.center),
                                      Image.asset(
                                        'assets/icon/Bathing.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Bathing",
                                        score = snap.data['PreOpBathing'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Bathing",
                                        score = snap.data['PostHosBathing'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 35),
                                    child: adlIcon(context, topic = "Bathing",
                                        score = snap.data['PostHomeBathing'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '''การกลั้นการถ่ายอุจจาระในระยะ 1 สัปดาห์ที่ผ่านมา''',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.asset(
                                        'assets/icon/Bowels.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Bowels",
                                        score = snap.data['PreOpBowels'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Bowels",
                                        score = snap.data['PostHosBowels'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Bowels",
                                        score = snap.data['PostHomeBowels'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        '''การกลั้นปัสสาวะในระยะ 1 สัปดาห์ที่ผ่านมา''',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                      Image.asset(
                                        'assets/icon/Bladder.png',
                                        height: 100,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Bladder",
                                        score = snap.data['PreOpBladder'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Bladder",
                                        score = snap.data['PostHosBladder'])),
                                Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: adlIcon(context, topic = "Bladder",
                                        score = snap.data['PostHomeBladder'])),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Text(
                                      "ผลรวม",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Text(
                                      "${snap.data['PreOpTotal']}",
                                      style: TextStyle(
                                          color: _customMaterial.getADLColor(
                                              snap.data['PreOpTotal'])),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Text(
                                      "${snap.data['PostHosTotal']}",
                                      style: TextStyle(
                                          color: _customMaterial.getADLColor(
                                              snap.data['PostHosTotal'])),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Text(
                                      "${snap.data['PostHomeTotal']}",
                                      style: TextStyle(
                                          color: _customMaterial.getADLColor(
                                              snap.data['PostHomeTotal'])),
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 0, 10),
                          child: Text(
                            '''ผลการประเมินการปฏิบัติกิจวัตรประจำวัน''',
                          ),
                        ),
                      ],
                    ),
                    PieChart(
                        totalScoreADL: snap.data['PostHomeTotal'] != null
                            ? snap.data['PostHomeTotal']
                            : snap.data['PostHosTotal'] != null
                                ? snap.data['PostHosTotal']
                                : snap.data['PreOpTotal'] != null
                                    ? snap.data['PreOpTotal']
                                    : 0),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
