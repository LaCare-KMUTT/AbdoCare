import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'ADL_chart.dart';
import 'line_chart.dart';
import 'radial_gauge_chart .dart';

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

  @override
  Widget build(BuildContext context) => Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                child: Text(
                                  'ข้อมูลสุขภาพ',
                                ),
                              ),
                            ],
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
                  Container(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                child: Text(
                                  'ความสามารถในการปฏิบัติกิจวัตรประจำวัน',
                                ),
                              ),
                            ],
                          ),
                          ADLTable(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                child: Text(
                                  'ผลการประเมินการปฏิบัติกิจวัตรประจำวัน',
                                ),
                              ),
                            ],
                          ),
                          PieChart(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                child: Text(
                                  'ความเจ็บปวด',
                                ),
                              ),
                            ],
                          ),
                          LineChart(data2: data2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
