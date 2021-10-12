import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'pages/appointment_page.dart';
import 'pages/chat_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/evaluation_page.dart';
import 'pages/login_page.dart';
import 'pages/notification_page.dart';
import 'pages/passcode_page.dart';
import 'pages/profile_page.dart';
import 'services/firebase_service.dart';
import 'services/service_locator.dart';
import 'stores/user_store.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupServiceLocator();
  await UserStore();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _firebaseService = FirebaseService();
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
                print(_firebaseService.getUserId());
                print('userSnapshot has data');
                _firebaseService.saveDataToSharedPref();
                // _firebaseService.signout(); //incase can't signout normally
                return PasscodePage();
              } else {
                print('auth change user snapshot doesn\'t have data');
                return LoginPage();
              }
            }),
        routes: {
          '/profile_page': (context) => ProfilePage(),
          '/login_page': (context) => LoginPage(),
          '/chat_page': (context) => ChatPage(),
          '/evaluation_page': (context) => EvaluationPage(),
          '/appoint_page': (context) => AppointmentPage(),
          '/dashboard_page': (context) => DashboardPage(),
          '/passcode_page': (context) => PasscodePage(),
          '/notification_page': (context) => NotificationPage(),
        },
      );
}
