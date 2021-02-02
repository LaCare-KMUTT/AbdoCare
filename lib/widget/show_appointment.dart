import 'package:flutter/material.dart';

import '../services/interfaces/calculation_service_interface.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';

class ShowAppointment extends StatefulWidget {
  @override
  State createState() => ShowAppointmentState();
}

class ShowAppointmentState extends State<ShowAppointment> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  final ICalculationService _calculationService =
      locator<ICalculationService>();
  List<Map<String, dynamic>> appointments = <Map<String, dynamic>>[];

  __initData() {
    var data = _getAppointments();
    print('IS NULL  ? ? ?$appointments');
    data.then((value) => appointments.addAll(value));
    print('aw my god$appointments');
  }

  Future<List<Map<String, dynamic>>> _getAppointments() async {
    final _appointments = await _firebaseService.getAppointments();
    print('=[]= showAppointment = $_appointments');
    print('${_appointments.length}');
    return _appointments;
  }

  @override
  void initState() {
    super.initState();
    __initData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var appointment in appointments)
          ExpansionTile(
            title: Text(
              _calculationService.formatDateToThaiString(
                  isBuddhist: true, date: appointment['date'].toDate()),
              style: TextStyle(color: Color(0xFFC37447)),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      'รายละเอียดการนัดหมาย',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(
                            'เวลา ${appointment['time']} น.',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'นัดมาตรวจ: ${appointment['reason']}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'การเตรียมความพร้อม: ${appointment['preparation']}',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ],
    );
  }
}
