import 'package:flutter/material.dart';
import '../pages/post_op_home_form_page.dart';

class RichMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RichMenuState();
}

class _RichMenuState extends State<RichMenu> {
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
              FlatButton(
                padding: EdgeInsets.only(top: 0),
                onPressed: () {
                  // not in NSC scope
                  //Navigator.pushNamed(context, '/evaluation_page');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostOpHomePage()),
                  );
                },
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    color: Color(0xFFFCECBC),
                  ),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: FlatButton(
                      color: Color(0xFFF8CC77),
                      onPressed: () {
                        Navigator.pushNamed(context, '/dashboard_page');
                      },
                      child: Container(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'สรุปผลประจำวัน',
                              style: Theme.of(context).textTheme.bodyText1,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Color(0xFFF1B43F),
                      onPressed: () {
                        Navigator.pushNamed(context, '/appoint_page');
                      },
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
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      color: Color(0xFFE38C14),
                      onPressed: () {
                        Navigator.pushNamed(context, '/training_page');
                      },
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
