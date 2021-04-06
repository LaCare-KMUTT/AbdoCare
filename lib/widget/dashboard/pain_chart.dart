import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

class PainChart extends StatefulWidget {
  PainChart({Key key}) : super(key: key);

  @override
  PainChartState createState() => PainChartState();
}

class PainChartState extends State<PainChart> {
  List<_PainData> data = [
    _PainData('10/03/64\n02.00น', 9),
    _PainData('10/03/64\n06.00น', 9),
    _PainData('10/03/64\n10.00น', 8),
    _PainData('10/03/64\n14.00น', 8),
    _PainData('10/03/64\n18.00น', 8),
    _PainData('10/03/64\n22.00น', 8),
    _PainData('11/03/64\n02.00น', 7),
    _PainData('11/03/64\n06.00น', 9),
    _PainData('11/03/64\n10.00น', 9),
    _PainData('11/03/64\n14.00น', 7),
    _PainData('11/03/64\n18.00น', 6),
    _PainData('11/03/64\n22.00น', 6),
    _PainData('12/03/64\n02.00น', 6),
    _PainData('12/03/64\n06.00น', 6),
    _PainData('12/03/64\n10.00น', 7),
    _PainData('12/03/64\n14.00น', 6),
    _PainData('12/03/64\n18.00น', 5),
    _PainData('12/03/64\n22.00น', 5),
    _PainData('13/03/64\n02.00น', 5),
    _PainData('13/03/64\n06.00น', 4),
    _PainData('13/03/64\n10.00น', 4),
    _PainData('13/03/64\n14.00น', 4),
    _PainData('13/03/64\n18.00น', 4),
    _PainData('13/03/64\n22.00น', 4),
    _PainData('14/03/64\n02.00น', 5),
    _PainData('14/03/64\n06.00น', 4),
    _PainData('14/03/64\n10.00น', 4),
    _PainData('14/03/64\n14.00น', 4),
    _PainData('14/03/64\n18.00น', 4),
    _PainData('14/03/64\n22.00น', 4),
  ];
  ZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: constraints.minWidth,
                      minHeight: constraints.minHeight),
                  child: IntrinsicWidth(
                    child: Container(
                      height: screenSize.height / 2,
                      width: screenSize.width * 4,
                      child: SfCartesianChart(
                          // zoomPanBehavior: _zoomPanBehavior,
                          primaryXAxis: CategoryAxis(),
                          primaryYAxis:
                              NumericAxis(anchorRangeToVisiblePoints: true),
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<_PainData, String>>[
                            LineSeries<_PainData, String>(
                                dataSource: data,
                                xValueMapper: (pain, _) => pain.painscore,
                                yValueMapper: (pain, _) => pain.day,
                                name: 'Pain score',
                                color: Colors.red,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true))
                          ]),
                    ),
                  ),
                ),
              ),
            ),
            SfCartesianChart(
                zoomPanBehavior: _zoomPanBehavior,
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(anchorRangeToVisiblePoints: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_PainData, String>>[
                  LineSeries<_PainData, String>(
                      dataSource: data,
                      xValueMapper: (pain, _) => pain.painscore,
                      yValueMapper: (pain, _) => pain.day,
                      name: 'Pain score',
                      color: Colors.red,
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ])
          ],
        ),
      );
    });
  }
}

class _PainData {
  _PainData(this.painscore, this.day);

  final String painscore;
  final double day;
}
