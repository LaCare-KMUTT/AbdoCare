import 'package:flutter/material.dart';

import '../models/appointment_list.dart';
import '../services/interfaces/calculation_service_interface.dart';
import '../services/service_locator.dart';
import 'shared/loading_widget.dart';

class ShowAppointment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShowAppointmentState();
}

class _ShowAppointmentState extends State<ShowAppointment> {
  final ICalculationService _calculationService =
      locator<ICalculationService>();

  AppointmentList _appointmentList;

  __initData() async {
    var appointmentList = await AppointmentList.create();
    setState(() {
      _appointmentList = appointmentList;
    });
  }

  @override
  void initState() {
    super.initState();
    __initData();
  }

  @override
  Widget build(BuildContext context) {
    if (_appointmentList == null) {
      return loadingProgress;
    } else {
      return FutureBuilder(
          future: _appointmentList.getAppointmentList(),
          builder: (context, _appointments) {
            if (!_appointments.hasData) {
              return loadingProgress;
            }
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    for (var appointment1 in _appointments.data)
                      ExpansionTile(
                        title: Text(
                          _calculationService.formatDateToThaiString(
                              isBuddhist: true,
                              date: appointment1['date'].toDate()),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Text(
                                        'เวลา ${appointment1['time']} น.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        '''นัดมาตรวจ: ${appointment1['reason']}''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      Text(
                                        '''การเตรียมความพร้อม: ${appointment1['preparation']}''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
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
                ),
              ],
            );
          });
    }
  }
}
