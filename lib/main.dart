import 'package:flutter/material.dart';

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
        theme: ThemeData(fontFamily: "Prompt"),
        home: LoginPage(),
        routes: {
          '/profile_page': (context) => ProfilePage(),
          '/login_page': (context) => LoginPage(),
          '/chat_page': (context) => MyHomePage(),
        },
      );
}
