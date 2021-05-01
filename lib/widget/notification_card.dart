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
                                      context,
                                      notification['imgURL'],
                                      notification['advice'],
                                      notification['formName']);
                                } else {
                                  alertShowTraining(
                                      context, notification['formName']);
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
                                          (() {
                                            if (notification['formName'] ==
                                                "Surgical Incision") {
                                              return Text(
                                                '''บุคลากรทางการแพทย์ได้ส่งคำแนะนำถึงคุณ''',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              );
                                            } else {
                                              return Text(
                                                '''ผู้ป่วยไม่ผ่านแบบประเมิน''',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              );
                                            }
                                          }()),
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

  Future<void> alertShowAdvice(BuildContext context, String imgURL,
      String advice, String formName) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "หมายเหตุการแจ้งเตือน",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            content: Builder(builder: (context) {
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return Container(
                height: height / 3,
                width: width,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: [
                        Text(
                          "ผู้ป่วยไม่ผ่าน${formNameModel[formName]}",
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "รูปภาพแผล:",
                          textAlign: TextAlign.start,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            height: 200,
                            child: Image.network(imgURL),
                          ),
                        ),
                        Text("คำแนะนำ:\t${advice ?? "-"}"),
                      ],
                    ),
                  ],
                ),
              );
            }),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC37447),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("ตกลง",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Future<void> alertShowTraining(BuildContext context, String formName) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text(
              "หมายเหตุการแจ้งเตือน",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            content: Text(
              "ผู้ป่วยไม่ผ่าน${formNameModel[formName]}",
              textAlign: TextAlign.center,
            ),
            actions: [
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC37447),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/training_page');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("คำแนะนำในการฟื้นตัว",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC37447),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("ตกลง",
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
