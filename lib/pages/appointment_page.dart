import 'package:flutter/material.dart';

import '../widget/appointment_table.dart';
import '../widget/chatbot/appointment_nav_bar.dart';

class AppointmentPage extends StatefulWidget {
  AppointmentPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ตารางนัด'),
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
      body: AppointmentTable(),
      bottomNavigationBar: AppointmentNavBar(),
    );
  }
}
