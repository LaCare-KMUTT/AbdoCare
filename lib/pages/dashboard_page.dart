import 'package:flutter/material.dart';
import '../widget/dashboard/dashboard.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('สรุปผลประจำวัน'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            tooltip: 'กลับ',
            onPressed: () {
              Navigator.pushNamed(context, '/chat_page');
            },
          ),
        ),
        body: Dashboard(),
      );
}
