import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/interfaces/calculation_service_interface.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import 'adl_chart.dart';
import 'line_chart.dart';
import 'radial_gauge_chart.dart';
import 'shared/loading_widget.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<PointSeries> data2 = [
    PointSeries(day: 0, point: 10),
    PointSeries(day: 1, point: 8),
    PointSeries(day: 2, point: 7),
    PointSeries(day: 3, point: 8),
    PointSeries(day: 4, point: 5),
    PointSeries(day: 5, point: 4),
    PointSeries(day: 6, point: 2),
  ];
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
  var _userId;
  var _userCollection;
  @override
  void initState() {
    super.initState();
    var userId = _firebaseService.getUserId();
    if (userId.isNotEmpty) {
      print('$userId is here');
    } else {
      print('$userId not found');
    }
    setState(() {
      _userId = userId;
      _userCollection = _firebaseService.getCollectionSnapshotByDocId(
          collection: 'Users', docId: _userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _userCollection,
        builder: (context, userCollection) {
          if (!userCollection.hasData) {
            return loadingProgress;
          } else {
            return FutureBuilder<Map<String, dynamic>>(
                future:
                    _firebaseService.getLatestAnSubCollection(userId: _userId),
                builder: (context, anSubCollection) {
                  if (!anSubCollection.hasData) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text('Loading...'),
                        ],
                      ),
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 10, 0, 10),
                                            child: Text(
                                              'ข้อมูลสุขภาพ',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          '''อายุ ${_calculationService.calculateAge(userCollection.data['dob'].toDate()).toString()} ปี''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''ส่วนสูง ${anSubCollection.data['height']} ซม.''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''น้ำหนัก ${anSubCollection.data['weight']} กก.''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          'ค่าดัชนีมวลกาย ${_calculationService.calculateBMI(anSubCollection.data['weight'], anSubCollection.data['height'])} Kg/m2',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      Text(
                                          '''%BWL = ${_calculationService.calculateBML(anSubCollection.data['oldWeight'], anSubCollection.data['weight'])} %''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ],
                                  ),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 0, 10),
                                          child: Text(
                                            '''ความสามารถในการปฏิบัติกิจวัตรประจำวัน''',
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
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 0, 10),
                                          child: Text(
                                            '''ผลการประเมินการปฏิบัติกิจวัตรประจำวัน''',
                                          ),
                                        ),
                                      ],
                                    ),
                                    RadialGaugeChart(),
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
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 0, 10),
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
                  );
                });
          }
        });
  }
}
