import 'package:flutter/material.dart';
import '../models/formname_model.dart';
import '../models/notification_list_model.dart';

class NotificationCard extends StatefulWidget {
  final List<NotiData> notiData;
  NotificationCard({Key key, @required this.notiData}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
          children: widget.notiData.map((noti) {
        return Padding(
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
                side: BorderSide(color: Colors.grey[200], width: 1),
              ),
              onPressed: () {
                if (noti.formName == "แบบประเมินแผล") {
                  alertShowAdvice(
                      context, noti.imgURL, noti.advice, noti.formName);
                } else {
                  alertShowTraining(context, noti.formName);
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
                          '''${noti.formDate}\t\t${noti.formTime}''',
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '''${noti.formName}''',
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          (() {
                            if (noti.formName == "แบบประเมินแผล") {
                              return Text(
                                '''บุคลากรทางการแพทย์ได้ส่งคำแนะนำถึงคุณ''',
                                style: Theme.of(context).textTheme.bodyText1,
                              );
                            } else {
                              return Text(
                                '''ผู้ป่วยไม่ผ่านแบบประเมิน''',
                                style: Theme.of(context).textTheme.bodyText1,
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
        );
      }).toList()),
    );
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
                          "ผู้ป่วยไม่ผ่าน$formName",
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
