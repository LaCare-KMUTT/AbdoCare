import 'dart:ui';
import 'package:flutter/material.dart';

class CustomMaterial {
  Color getADLColor(dynamic adlScore) {
    if (adlScore == '-') {
      return Colors.black;
    } else if (adlScore <= 4) {
      return Colors.red;
    } else if (adlScore >= 5 && adlScore <= 8) {
      return Colors.orange;
    } else if (adlScore >= 9 && adlScore <= 11) {
      return Colors.amber;
    }
    return Colors.green;
  }
}
