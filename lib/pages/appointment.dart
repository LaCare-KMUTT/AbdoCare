import 'package:flutter/material.dart';
import '../widget/chatbot/appointment_nav_bar.dart';
import '../widget/show_appointment.dart';

class AppointPage extends StatefulWidget {
  AppointPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _AppointPageState();
}

class _AppointPageState extends State<AppointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ShowAppointment(),
      bottomNavigationBar: AppointmentNavBar(),
    );
  }
}
