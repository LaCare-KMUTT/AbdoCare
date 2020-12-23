import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';

import 'pages/appointment.dart';
import 'pages/chat_page.dart';
import 'pages/dashboard.dart';
import 'pages/evaluation_page.dart';
import 'pages/login_page.dart';
import 'pages/passcode_page.dart';
import 'pages/profile_page.dart';
import 'pages/training_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            bodyText1: TextStyle(fontSize: 16.0, color: Colors.black),
            bodyText2: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC37447)),
          ),
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                print(FirebaseAuth.instance.currentUser.uid);
                print('userSnapshot has data');
                return PasscodePage();
              } else {
                print('auth change user snapshot doesn\'t have data');
                return LoginPage();
              }
            }),

        // LoginPage(),
        routes: {
          '/profile_page': (context) => ProfilePage(),
          '/login_page': (context) => LoginPage(),
          '/chat_page': (context) => ChatPage(),
          '/evaluation_page': (context) => EvaluationPage(),
          '/appoint_page': (context) => AppointPage(),
          '/dashboard_page': (context) => DashboardPage(),
          '/training_page': (context) => TrainingPage(),
          '/passcode_page': (context) => PasscodePage(),
        },
      );
}
