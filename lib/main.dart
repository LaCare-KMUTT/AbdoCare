// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

import 'package:AbdoCare/pages/Login.dart';
import 'package:AbdoCare/pages/Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/profile_page': (context) => ProfilePage(),
        '/login_page': (context) => LoginPage(),
      },
    );
  }
}
