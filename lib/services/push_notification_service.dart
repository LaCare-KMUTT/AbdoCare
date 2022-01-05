import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    // if (Platform.isIOS) {
    // await _fcm.requestPermission(
    //     alert: true,
    //     announcement: false,
    //     badge: true,
    //     carPlay: false,
    //     criticalAlert: false,
    //     provisional: false,
    //     sound: true);
    // }
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    var token = await _fcm.getToken();
    print("token = $token");
    _fcm.getInitialMessage();

    ///foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print('THIS IS PUSH NOTI');
        print(message.notification.title);
        print(message.notification.body);
      }
    });
  }

  Future<String> getToken() async {
    return await _fcm.getToken();
  }

  Future<String> getPlatform() async {
    var platformName = "undefinded";
    if (Platform.isAndroid) {
      platformName = "android";
    } else if (Platform.isIOS) {
      platformName = "ios";
    }
    return await platformName;
  }
}
