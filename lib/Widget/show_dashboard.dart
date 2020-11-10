import 'package:AbdoCare/Widget/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ShowDashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShowDashboardState();
  }
}

class _ShowDashboardState extends State<ShowDashboard> {
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      year: "การรับประทานอาหาร",
      subscribers: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การขึ้นลงบันได1ชั้น",
      subscribers: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การสวมใส่เสื้อผ้า",
      subscribers: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การเคลื่อนที่ภายในบ้าน",
      subscribers: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การอาบน้ำ",
      subscribers: 0,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การใช้ห้องน้ำ",
      subscribers: 1,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การกลั้นอุจจาระในระยะ\n1 สัปดาห์ที่ผ่านมา",
      subscribers: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การกลั้นปัสสาวะในระยะ\n1 สัปดาห์ที่ผ่านมา",
      subscribers: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    SubscriberSeries(
      year: "การล้างหน้า หวีผม \nแปลงฟัน",
      subscribers: 3,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFC37447),
                    child: Text(
                      'Nutrition',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'พัฒนาการในแต่ละหัวข้อ',
                ),
                BarChart(data: data),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
