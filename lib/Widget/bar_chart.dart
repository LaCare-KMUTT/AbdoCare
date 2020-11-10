import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<SubscriberSeries> data;
  BarChart({@required this.data});

  //const BarChart({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.year,
          measureFn: (SubscriberSeries series, _) => series.subscribers,
          colorFn: (SubscriberSeries series, _) => series.barColor),
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(0),
      child: Card(
        child: Column(
          children: [
            // Text('data'),
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

class SubscriberSeries {
  final String year;
  final int subscribers;
  final charts.Color barColor;
  SubscriberSeries(
      {@required this.year,
      @required this.subscribers,
      @required this.barColor});
}
