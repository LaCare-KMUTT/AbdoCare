import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ADLChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /******************** Example 1 ********************/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การรับประทานอาหาร',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  currentStep: 1,
                  padding: 0,
                  totalSteps: 3,
                  size: 20,
                  selectedColor: Colors.red,
                  unselectedColor: Colors.grey[200],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การอาบน้ำ',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  currentStep: 2,
                  padding: 0,
                  totalSteps: 4,
                  size: 20,
                  selectedColor: Colors.orange,
                  unselectedColor: Colors.grey[200],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การลุกจากที่นอน',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  currentStep: 2,
                  padding: 0,
                  totalSteps: 3,
                  size: 20,
                  selectedColor: Colors.yellow,
                  unselectedColor: Colors.grey[200],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การเดินขึ้นลงบันได',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  currentStep: 3,
                  padding: 0,
                  totalSteps: 3,
                  size: 20,
                  selectedColor: Colors.green,
                  unselectedColor: Colors.grey[200],
                ),
              ],
            ),
          ),
          /******************** Example 2 ********************/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การรับประทานอาหาร',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  padding: 0,
                  totalSteps: 3,
                  size: 20,
                  selectedColor: Colors.red,
                  unselectedColor: Colors.grey[400],
                  customColor: (index) {
                    // The scores that the patient got in this question
                    var answer = 1;
                    if (answer >= 0 && index == 0) {
                      return Colors.red;
                    } else if (answer >= 1 && index == 1) {
                      return Colors.yellow;
                    } else if (answer == 2 && index == 2) {
                      return Colors.green;
                    } else {
                      return Colors.grey[200];
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text(
                    '''ล้างหน้า หวีผม แปรงฟัน โกนหนวด ในระยะเวลา 24 - 28 ชั่วโมงที่ผ่านมา''',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  totalSteps: 2,
                  size: 20,
                  selectedColor: Colors.red,
                  unselectedColor: Colors.grey[400],
                  customColor: (index) {
                    // The scores that the patient got in this question
                    var answer = 1;
                    if (answer >= 0 && index == 0) {
                      return Colors.red;
                    } else if (answer == 1 && index == 1) {
                      return Colors.green;
                    } else {
                      return Colors.grey[200];
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การลุกจากที่นอน',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  totalSteps: 4,
                  size: 20,
                  selectedColor: Colors.red,
                  unselectedColor: Colors.grey[400],
                  customColor: (index) {
                    // The scores that the patient got in this question
                    var answer = 3;
                    if (answer >= 0 && index == 0) {
                      return Colors.red;
                    } else if (answer >= 1 && index == 1) {
                      return Colors.orange;
                    } else if (answer >= 2 && index == 2) {
                      return Colors.yellow;
                    } else if (answer == 3 && index == 3) {
                      return Colors.green;
                    } else {
                      return Colors.grey[200];
                    }
                  },
                ),
              ],
            ),
          ),
          /******************** Example 3 ********************/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: Column(
              children: [
                Text('การใช้ห้องน้ำ',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  totalSteps: 3,
                  customStep: (index, color, size) {
                    var answer = 1;
                    if (answer >= 0 && index == 0) {
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                        size: 50,
                      );
                    } else if (answer >= 1 && index == 1) {
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.yellow,
                        size: 50,
                      );
                    } else if (answer != 1 && index == 1) {
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.grey[300],
                        size: 50,
                      );
                    } else if (answer >= 2 && index == 2) {
                      return Icon(
                        Icons.sentiment_very_satisfied_outlined,
                        color: Colors.green,
                        size: 50,
                      );
                    } else if (answer != 2 && index == 2) {
                      return Icon(
                        Icons.sentiment_very_satisfied_outlined,
                        color: Colors.grey[300],
                        size: 50,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: Column(
              children: [
                Text('การเคลื่อนที่ภายในห้องหรือบ้าน',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  totalSteps: 4,
                  customStep: (index, color, size) {
                    // The scores that the patient got in this question
                    var answer = 3;
                    if (answer >= 0 && index == 0) {
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                        size: 50,
                      );
                    } else if (answer >= 1 && index == 1) {
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.orange,
                        size: 50,
                      );
                    } else if (answer != 1 && index == 1) {
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.grey[300],
                        size: 50,
                      );
                    } else if (answer >= 2 && index == 2) {
                      return Icon(
                        Icons.sentiment_satisfied_outlined,
                        color: Colors.yellow,
                        size: 50,
                      );
                    } else if (answer != 2 && index == 2) {
                      return Icon(
                        Icons.sentiment_satisfied_outlined,
                        color: Colors.grey[300],
                        size: 50,
                      );
                    } else if (answer >= 3 && index == 3) {
                      return Icon(
                        Icons.sentiment_very_satisfied_outlined,
                        color: Colors.green,
                        size: 50,
                      );
                    } else if (answer != 3 && index == 3) {
                      return Icon(
                        Icons.sentiment_very_satisfied_outlined,
                        color: Colors.grey[300],
                        size: 50,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 40),
            child: Column(
              children: [
                Text('การสวมใส่เสื้อผ้า',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                StepProgressIndicator(
                  totalSteps: 2,
                  customStep: (index, color, size) {
                    var answer = 0;
                    if (answer >= 0 && index == 0) {
                      return Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.red,
                        size: 50,
                      );
                    } else if (answer >= 1 && index == 1) {
                      return Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.green,
                        size: 50,
                      );
                    } else if (answer != 1 && index == 1) {
                      return Icon(
                        Icons.sentiment_very_satisfied_outlined,
                        color: Colors.grey[300],
                        size: 50,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          /******************** Example 3 ********************/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การขึ้นลงบันได1ชั้น',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                Container(
                  height: 100,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                          axisLineStyle: AxisLineStyle(
                            thickness: 20,
                          ),
                          startAngle: -90,
                          endAngle: 270,
                          showTicks: false,
                          showLabels: false,
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: 50, width: 20, color: Color(0xFFC37447))
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Container(
                                    child: Text('50 %',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16))),
                                angle: 90,
                                positionFactor: 0.2)
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การอาบน้ำ',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                Container(
                  height: 100,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                          axisLineStyle: AxisLineStyle(
                            thickness: 20,
                          ),
                          startAngle: -90,
                          endAngle: 270,
                          showTicks: false,
                          showLabels: false,
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: 100, width: 20, color: Color(0xFFC37447))
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Container(
                                  child: Text('100 %',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16))),
                              angle: 90,
                              positionFactor: 0.2,
                            )
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การกลั้นอุจจาระในระยะ 1 สัปดาห์ที่ผ่านมา',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                Container(
                  height: 100,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                          axisLineStyle: AxisLineStyle(
                            thickness: 20,
                          ),
                          startAngle: -90,
                          endAngle: 270,
                          showTicks: false,
                          showLabels: false,
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: 25, width: 20, color: Color(0xFFC37447))
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Container(
                                    child: Text('25 %',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16))),
                                angle: 90,
                                positionFactor: 0.2)
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Text('การกลั้นปัสสาวะในระยะ 1 สัปดาห์ที่ผ่านมา',
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.left),
                Container(
                  height: 100,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                          axisLineStyle: AxisLineStyle(
                            thickness: 20,
                          ),
                          startAngle: -90,
                          endAngle: 270,
                          showTicks: false,
                          showLabels: false,
                          pointers: <GaugePointer>[
                            RangePointer(
                                value: 75, width: 20, color: Color(0xFFC37447))
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Container(
                                    child: Text('75 %',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16))),
                                angle: 90,
                                positionFactor: 0.2)
                          ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          /******************** Example 4 ********************/
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('การขึ้นลงบันได 1 ชั้น',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                thickness: 20,
                              ),
                              startAngle: -90,
                              endAngle: 270,
                              showTicks: false,
                              showLabels: false,
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: 50,
                                    width: 20,
                                    color: Color(0xFFC37447))
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('50 %',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16))),
                                    angle: 90,
                                    positionFactor: 0.2)
                              ]),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('การอาบน้ำ',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                thickness: 20,
                              ),
                              startAngle: -90,
                              endAngle: 270,
                              showTicks: false,
                              showLabels: false,
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: 100,
                                    width: 20,
                                    color: Color(0xFFC37447))
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('100 %',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16))),
                                    angle: 90,
                                    positionFactor: 0.2)
                              ]),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('การกลั้นอุจจาระในระยะ 1 สัปดาห์ที่ผ่านมา',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                thickness: 20,
                              ),
                              startAngle: -90,
                              endAngle: 270,
                              showTicks: false,
                              showLabels: false,
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: 25,
                                    width: 20,
                                    color: Color(0xFFC37447))
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('25 %',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16))),
                                    angle: 90,
                                    positionFactor: 0.2)
                              ]),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('การกลั้นปัสสาวะในระยะ 1 สัปดาห์ที่ผ่านมา',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                              axisLineStyle: AxisLineStyle(
                                thickness: 20,
                              ),
                              startAngle: -90,
                              endAngle: 270,
                              showTicks: false,
                              showLabels: false,
                              pointers: <GaugePointer>[
                                RangePointer(
                                    value: 75,
                                    width: 20,
                                    color: Color(0xFFC37447))
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('75 %',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16))),
                                    angle: 90,
                                    positionFactor: 0.2)
                              ]),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      );
}

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
