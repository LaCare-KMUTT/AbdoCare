import 'package:flutter/material.dart';

abstract class ICalculationService {
  int calculateAge(DateTime birthDate);
  String calculateBMI(int weight, int height);
  DateTime formatDate({DateTime date, String dateString});
  String calculateBML(int oldWeight, int weight);
  String formatDateToThaiString(
      {DateTime date, String dateString, @required bool isBuddhist});
  int calculateDayDifference(
      {@required DateTime day, @required DateTime compareTo});
}
