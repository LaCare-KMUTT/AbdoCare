import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<BarSerise> data;
  BarChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    var series = <charts.Series<BarSerise, String>>[
      charts.Series(
          id: "Subscribers",
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

class BarSerise {
  final String topic;
  final int point;
  final charts.Color barColor;
  BarSerise(
      {@required this.topic, @required this.point, @required this.barColor});
}
