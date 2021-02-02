import 'package:flutter/material.dart';

abstract class ICalculationService {
  int calculateAge(DateTime birthDate);
  String calculateBMI(int weight, int height);
  DateTime formatDate({DateTime date, String dateString});
  String formatDateToThaiString(
      {DateTime date, String dateString, @required bool isBuddhist});
}
