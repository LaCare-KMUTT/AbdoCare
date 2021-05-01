import 'package:AbdoCare/models/formname_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/notification_list_model.dart';
import '../widget/shared/loading_widget.dart';

class NotificationCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  NotificationList _notificationList;
  __initData() async {
    var notificationList = await NotificationList.create();
    setState(() {
      _notificationList = notificationList;
    });
  }

  @override
  void initState() {
    super.initState();
    __initData();
  }

  String datetime(dynamic time, String value) {
    var formTime =
        DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
    var formDateToShow = DateFormat('dd/MM/yyyy').format(formTime);
    var formTimeToShow = DateFormat.Hm().format(formTime).toString() + " น.";
    if (value == "Date") {
      return formDateToShow;
    } else {
      return formTimeToShow;
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (_notificationList == null) {
      return loadingProgress;
    } else {
      return FutureBuilder(
          future: _notificationList.getNotificationList(),
          builder: (context, _notification) {
            if (!_notification.hasData) {
              return loadingProgress;
            }
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Column(
                    children: <Widget>[
                      for (var notification in _notification.data)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: AbsorbPointer(
                            absorbing: false,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                shadowColor: Colors.black,
                                side: BorderSide(
                                    color: Colors.grey[200], width: 1),
                              ),
                              onPressed: () {
                                if (notification['formName'] ==
                                    "Surgical Incision") {
                                  alertShowAdvice(
                                      context, notification['imgURL']);
                                } else {
                                  // alertShowAdvice(
                                  //     context, notification['imgURL']);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '''${datetime(notification['creation'], "Date")}\t\t${datetime(notification['creation'], "Time")}''',
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.grey[600],
                                          ),
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '''${formNameModel[notification['formName']]}''',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '''ผู้ป่วยไม่ผ่านแบบประเมิน''',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
  }

  Future<void> alertShowAdvice(BuildContext context, String imgURL) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Pang"),
            content: Column(
              children: [
                Text("Pang"),
                Container(
                  padding: EdgeInsets.only(top: 0, bottom: 8),
                  width: 400,
                  height: 300,
                  child: Image.network(imgURL),
                ),
              ],
            ),
          );
        });
  }
}
