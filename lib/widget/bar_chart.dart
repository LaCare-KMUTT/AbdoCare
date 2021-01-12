import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<BarSeries> data;
  BarChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    var series = <charts.Series<BarSeries, String>>[
      charts.Series(
          id: "ADL",
          data: data,
          domainFn: (series, _) => series.topic,
          measureFn: (series, _) => series.point,
          colorFn: (series, _) => series.barColor),
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(0),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
                vertical: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BarSeries {
  final String topic;
  final int point;
  final charts.Color barColor;
  BarSeries(
      {@required this.topic, @required this.point, @required this.barColor});
}
