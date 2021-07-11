import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PainChart extends StatefulWidget {
  final AsyncSnapshot<List<Map<String, dynamic>>> snapshot;
  PainChart({this.snapshot});

  @override
  PainChartState createState() => PainChartState();
}

class PainChartState extends State<PainChart> {
  final formatter = DateFormat('dd/MM/yyyy');
  List<_PainData> data = [];
  @override
  void initState() {
    super.initState();
    final formatter = DateFormat('dd/MM/yyyy');
    // ignore: avoid_function_literals_in_foreach_calls
    widget.snapshot.data.forEach((element) {
      var painScore = element['PainScore'] ?? 0;
      var dateFromDb = element['Date'].toDate();
      var formattedDate = formatter.format(dateFromDb);
      var formTime = element['Time'] ?? '';
      var date = '$formattedDate\n$formTime';
      data.add(_PainData(day: date, painScore: painScore));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.snapshot.data == null || widget.snapshot.data.isEmpty
            ? 30
            : 300,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    legend: Legend(isVisible: false),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_PainData, String>>[
                      LineSeries<_PainData, String>(
                          dataSource: data,
                          xValueMapper: (pain, _) => pain.day,
                          yValueMapper: (pain, _) => pain.painScore,
                          name: 'Pain score',
                          color: Colors.red,
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]),
              ],
            )
          ],
        ));
  }
}

class _PainData {
  _PainData({this.painScore, this.day});
  final String day;
  final int painScore;
}
