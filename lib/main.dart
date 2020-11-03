import 'package:flutter/material.dart';
import 'pages/Appointment.dart';
import 'pages/Chat.dart';
import 'pages/Login.dart';
import 'pages/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          fontFamily: "Prompt",
          primaryColor: Color(0xFFC37447),
          primarySwatch: Colors.amber,
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 18.0, color: Colors.black),
            bodyText2: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC37447)),
          ),
        ),
        home: LoginPage(),
        routes: {
          '/profile_page': (context) => ProfilePage(),
          '/login_page': (context) => LoginPage(),
          '/chat_page': (context) => MyHomePage(),
          '/appoint_page': (context) => AppointPage(),
        },
      );
}
