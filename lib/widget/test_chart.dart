import 'dart:math' as math;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Testchart extends StatefulWidget {
  @override
  State createState() => TestchartState();
}

class TestchartState extends State<Testchart> {
  @override
  Widget build(BuildContext context) => ExpandableTheme(
      data: const ExpandableThemeData(
        iconColor: Colors.blue,
        useInkWell: true,
      ),
      child: Column(
        children: [TopicList()],
      ));
}

class TopicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    buildList() => Column(
          children: <Widget>[
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
                  height: 120,
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
                  height: 120,
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
                  height: 120,
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
            //for (var i in [1]) buildItem("Item ${i}"),
          ],
        );

    return ExpandableNotifier(
        child: ScrollOnExpand(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: false,
              ),
              header: Container(
                color: Colors.white,
                //Color(0xFFFCECBC)
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "ความสามารถในการปฏิบัติกิจวัตรประจำวัน",
                        ),
                      ),
                      ExpandableIcon(
                        theme: const ExpandableThemeData(
                          expandIcon: Icons.arrow_right,
                          collapseIcon: Icons.arrow_drop_down,
                          iconColor: Color(0xFFC37447),
                          iconSize: 30,
                          iconRotationAngle: math.pi / 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              expanded: buildList(),
            ),
          ],
        ),
      ),
    ));
  }
}
