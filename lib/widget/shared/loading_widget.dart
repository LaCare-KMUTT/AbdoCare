import 'package:flutter/material.dart';

Center loadingProgress = Center(
  child: Column(
    children: <Widget>[
      CircularProgressIndicator(),
      Text('Loading...'),
    ],
  ),
);
