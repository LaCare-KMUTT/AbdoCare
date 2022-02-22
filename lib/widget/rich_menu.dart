import 'package:flutter/material.dart';
import '../pages/training_page.dart';
import '../services/interfaces/firebase_service_interface.dart';
import '../services/service_locator.dart';
import '../stores/user_store.dart';

class RichMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RichMenuState();
}

class _RichMenuState extends State<RichMenu> {
  final IFirebaseService _firebaseService = locator<IFirebaseService>();
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey[900].withOpacity(0.62),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text('เมนูหลัก',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.orange,
                            size: 25,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Color(0xFFFCECBC)),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'แบบประเมินพัฒนาการของผู้ป่วย',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/evaluation_page');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFF8CC77)),
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'สรุปผลประจำวัน',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard_page');
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFF1B43F)),
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ตารางนัด',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/appoint_page');
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFE38C14)),
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'การฝึกสอน',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () async {
                        var storedUserId =
                            UserStore.getValueFromStore('storedUserId');
                        var anSubcollection = await _firebaseService
                            .getLatestAnSubCollection(userId: storedUserId);
                        var _patientState = anSubcollection["state"];

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TrainingPage(patientState: _patientState)),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
