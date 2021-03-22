import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  TestPage({Key key}) : super(key: key);

  @override
  TestPageState createState() => TestPageState();
}

class TestPageState extends State<TestPage> {
  List<_SalesData> data = [
    _SalesData('วันที่ 1', 8),
    _SalesData('วันที่ 2', 7),
    _SalesData('วันที่ 3', 7),
    _SalesData('วันที่ 4', 5),
    _SalesData('วันที่ 5', 3),
    _SalesData('วันที่ 6', 3),
    _SalesData('วันที่ 7', 3)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(children: [
        Expanded(
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              legend: Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                    dataSource: data,
                    xValueMapper: (sales, _) => sales.year,
                    yValueMapper: (sales, _) => sales.sales,
                    name: 'ความเจ็บปวด',
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]),
        ),
      ]),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
