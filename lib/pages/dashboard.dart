import 'package:flutter/material.dart';
import '../widget/show_dashboard.dart';

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
