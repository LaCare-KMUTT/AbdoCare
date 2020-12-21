import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart.dart';
import 'line_chart.dart';

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

  final List<SubscriberSeries> data = [
    SubscriberSeries(
      topic: "การรับประทานอาหาร",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    SubscriberSeries(
      topic: "การขึ้นลงบันได1ชั้น",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การสวมใส่เสื้อผ้า",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การลุกจากที่นอน",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การเคลื่อนที่ภายใน\nห้องหรือบ้าน",
      point: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.lightBlue),
    ),
    SubscriberSeries(
      topic: "การอาบน้ำ",
      point: 0,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การใช้ห้องน้ำ",
      point: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การกลั้นอุจจาระในระยะ\n1 สัปดาห์ที่ผ่านมา",
      point: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การกลั้นปัสสาวะในระยะ\n1 สัปดาห์ที่ผ่านมา",
      point: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.pinkAccent),
    ),
    SubscriberSeries(
      topic: "การล้างหน้า หวีผม \nแปลงฟัน",
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('ข้อมูลสุขภาพ'),
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
                Text(
                  'พัฒนาการในแต่ละหัวข้อ',
                ),
                BarChart(data: data),
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
