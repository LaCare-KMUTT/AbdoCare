import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SfRadialGauge(
                enableLoadingAnimation: true,
                animationDuration: 4000,
                axes: <RadialAxis>[
                  RadialAxis(
                      axisLineStyle: AxisLineStyle(
                        thickness: 0.4,
                        thicknessUnit: GaugeSizeUnit.factor,
                        gradient: SweepGradient(colors: <Color>[
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green
                        ], stops: <double>[
                          0.10,
                          0.25,
                          0.50,
                          1
                        ]),
                      ),
                      showTicks: false,
                      canScaleToFit: true,
                      startAngle: 180,
                      endAngle: 0,
                      interval: 2,
                      minimum: 0,
                      maximum: 20,
                      ranges: <GaugeRange>[
                        GaugeRange(
                            startValue: 0,
                            endValue: 4,
                            color: Colors.red,
                            startWidth: 30,
                            endWidth: 30),
                        GaugeRange(
                            startValue: 4,
                            endValue: 8,
                            color: Colors.orange,
                            startWidth: 30,
                            endWidth: 30),
                        GaugeRange(
                            startValue: 8,
                            endValue: 11,
                            color: Colors.yellow,
                            startWidth: 30,
                            endWidth: 30),
                        GaugeRange(
                            startValue: 11,
                            endValue: 20,
                            color: Colors.green,
                            startWidth: 30,
                            endWidth: 30)
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                            value: 12,
                            lengthUnit: GaugeSizeUnit.logicalPixel,
                            needleLength: 70)
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Text(
                              'ผลคะแนน\n12 คะแนน',
                            )),
                            angle: 90,
                            positionFactor: 0.5)
                      ])
                ]),
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
      );
}
