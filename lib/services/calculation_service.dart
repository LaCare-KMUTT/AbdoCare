import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'interfaces/calculation_service_interface.dart';

class CalculationService extends ICalculationService {
  int calculateAge(DateTime birthDate) {
    var currentDate = DateTime.now();
    var age = currentDate.year - birthDate.year;
    var month1 = currentDate.month;
    var month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      var day1 = currentDate.day;
      var day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  String calculateBMI(int weight, int height) {
    var heightMeter = height / 100;
    var bmi = (weight) / (heightMeter * heightMeter);
    return bmi.toStringAsFixed(2);
  }

  DateTime formatDate({DateTime date, String dateString}) {
    if (date == null && dateString != null) {
      date = DateTime.parse(dateString);
    }
    var buddhistYear = date.year + 543;
    var normalYear = date.year;
    DateFormat formatter;
    if (date.hour == null || date.minute == null || date.second == null) {
      formatter = DateFormat('yyyy-MM-dd');
    } else {
      formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    }
    String formatted = formatter.format(date);
    var formattedString =
        formatted.replaceAll(normalYear.toString(), buddhistYear.toString());
    var formattedDate = DateTime.parse(formattedString);
    print('parse $date to $formattedDate');
    return formattedDate;
  }

  String formatDateToThaiString({DateTime date, String dateString}) {
    initializeDateFormatting();
    if (date == null && dateString != null) {
      date = DateTime.parse(dateString);
    }
    var buddhistYear = this.formatDate(date: date);
    String formatted = DateFormat.yMMMMEEEEd('th').format(date);
    String yearFormatted = formatted.replaceAll('ค.ศ.', 'พ.ศ.');
    String returnVal = yearFormatted.replaceAll(
        date.year.toString(), buddhistYear.year.toString());
    return returnVal;
  }
}
