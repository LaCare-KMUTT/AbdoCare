import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../services/interfaces/calculation_service_interface.dart';
import '../../services/interfaces/firebase_service_interface.dart';
import '../../services/service_locator.dart';
import '../shared/loading_widget.dart';
import 'adl_table_chart.dart';
import 'pain_chart.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            return Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text('Loading...'),
                ],
              ),
            );
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
                                          '''%BWL = ${_calculationService.calculateBWL(anSubCollection.data['oldWeight'], anSubCollection.data['weight'])} %''',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: ADLTable(),
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
                                    Container(
                                      child: FutureBuilder<
                                              List<Map<String, dynamic>>>(
                                          future: _firebaseService
                                              .getDashboardGraph(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                  child: loadingProgress);
                                            }
                                            if (snapshot.data.isEmpty ||
                                                snapshot.data == null) {
                                              return Text(
                                                  '''ไม่มีข้อมูลจากแบบฟอร์มความเจ็บปวด''',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1);
                                            }
                                            return PainChart(
                                                snapshot: snapshot);
                                          }),
                                    )
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
