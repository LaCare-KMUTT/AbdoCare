import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'bar_chart.dart';
import 'line_chart.dart';
import 'pie_chart.dart';

class ShowDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowDashboardState();
}

class _ShowDashboardState extends State<ShowDashboard> {
  final List<PointSeries> data2 = [
    PointSeries(day: 0, point: 10),
    PointSeries(day: 1, point: 8),
    PointSeries(day: 2, point: 7),
    PointSeries(day: 3, point: 8),
    PointSeries(day: 4, point: 5),
    PointSeries(day: 5, point: 4),
    PointSeries(day: 6, point: 2),
  ];
  final List<BarSerise> data3 = [
    BarSerise(
      topic: "ผลรวมคะแนน",
      point: 12,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];
  final List<BarSerise> data = [
    BarSerise(
      topic: "การรับประทานอาหาร",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    BarSerise(
      topic: "การขึ้นลงบันได1ชั้น",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    BarSerise(
      topic: "การสวมใส่เสื้อผ้า",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    BarSerise(
      topic: "การลุกจากที่นอน",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    BarSerise(
      topic: "การเคลื่อนที่ภายใน\nห้องหรือบ้าน",
      point: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    BarSerise(
      topic: "การอาบน้ำ",
      point: 0,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    BarSerise(
      topic: "การใช้ห้องน้ำ",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    BarSerise(
      topic: "การกลั้นอุจจาระในระยะ\n1 สัปดาห์ที่ผ่านมา",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    BarSerise(
      topic: "การกลั้นปัสสาวะในระยะ\n1 สัปดาห์ที่ผ่านมา",
      point: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    BarSerise(
      topic: "การล้างหน้า หวีผม \nแปรงฟัน",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text('ข้อมูลสุขภาพ'),
                ),
                Container(
                  child: Card(
                    child: Column(
                      children: [
                        Text('อายุ 21 ปี',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('ส่วนสูง 160.0 ซม.',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('น้ำหนัก 60.0 กก.',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('ค่าดัชนีมวลกาย 23.44 Kg/m2 (ท้วม)',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('น้ำหนักเมื่อ 3 เดือนที่ผ่านมา 65.0 กก.',
                            style: Theme.of(context).textTheme.bodyText1),
                        Text('%BWL = 2%',
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'ความสามารถในการปฏิบัติกิจวัตรประจำวัน',
                  ),
                ),
                BarChart(data: data),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100,
                        child: BarChart(data: data3),
                      ),
                      //PieChart(),
                      Text('การแปลผล',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.left),
                      Text('12 คะแนนขึ้นไป = mild independence',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center),
                      Text('9-11 คะแนน= moderately independence',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center),
                      Text('5-8 คะแนน = severe independence',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center),
                      Text('0-4 คะแนน = total independence',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'ความเจ็บปวด',
                  ),
                ),
                LineChart(data2: data2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
