import 'package:flutter/material.dart';
import 'pages/Chat.dart';
// import 'package:flutter_dialogflow/dialogflow_v2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      routes: {},
    );
  }
}
