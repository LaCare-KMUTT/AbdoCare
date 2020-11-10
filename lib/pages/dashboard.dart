import 'package:AbdoCare/Widget/show_dashboard.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('สรุปผลประจำวัน'),
      ),
      body: ShowDashboard(),
    );
  }
}
