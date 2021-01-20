import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ADLTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Table(
              border: TableBorder.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 1),
              columnWidths: {
                0: FractionColumnWidth(0.75),
                1: FractionColumnWidth(0.25)
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
                  Column(children: [
                    Text(
                      'ผลประเมิน',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFFC37447)),
                    )
                  ]),
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
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Icon(
                      Icons.sentiment_very_satisfied_outlined,
                      color: Colors.green,
                      size: 80,
                    ),
                  ),
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
                                color: Colors.black)),
                        Image.asset(
                          'assets/icon/Grooming.png',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                      size: 80,
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text("การลุกนั่งจากที่นอนหรือเตียงไปยังเก้าอี้",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                        Image.asset(
                          'assets/icon/Transfer.png',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Icon(
                      Icons.sentiment_satisfied_outlined,
                      color: Colors.yellow[600],
                      size: 80,
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          "การใช้ห้องน้ำ",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Image.asset(
                          'assets/icon/Toilet.png',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.orange,
                      size: 80,
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          "การเคลื่อนที่ภายในห้องหรือบ้าน",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Image.asset(
                          'assets/icon/Mobility.png',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Icon(
                      Icons.sentiment_satisfied_outlined,
                      color: Colors.yellow[600],
                      size: 80,
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Text(
                          "การสวมใส่เสื้อผ้า",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        Image.asset(
                          'assets/icon/Dressing.png',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Icon(
                      Icons.sentiment_very_satisfied_outlined,
                      color: Colors.green,
                      size: 80,
                    ),
                  ),
                ]),
              ],
            ),
          )
        ],
      );
}
