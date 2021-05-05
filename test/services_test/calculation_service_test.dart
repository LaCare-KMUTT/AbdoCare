import 'package:AbdoCare/services/interfaces/calculation_service_interface.dart';
import 'package:AbdoCare/services/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() {
    setupServiceLocator();
    locator.allowReassignment = true;
  });
  test('calculateAge should be able to calculate', () {
    ICalculationService _calculationService = locator<ICalculationService>();
    var age = _calculationService.calculateAge(DateTime(2542, 03, 12));
    expect(age, 22);
  });

  group('Calculate BMI', () {
    test('Calculate BWL should return 0.00 when divider is 0', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var bmi = _calculationService.calculateBMI(0, 170);
      expect(bmi, "0.00");
    });
    test('Calculate BWL should return 0.00 when both values are 0', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var bmi = _calculationService.calculateBMI(0, 0);
      expect(bmi, "0.00");
    });
    test('calculate BMI should be correct', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var bmi = _calculationService.calculateBMI(70, 170);
      expect(bmi, "24.22");
    });
    test('Calculate BMI should handle null value', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var bmi = _calculationService.calculateBMI(null, null);
      expect(bmi, '0.00');
    });
  });
  group('Calculate BWL', () {
    test('Calculate BWL should return 0.00 when divider is 0', () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var result = _calculationService.calculateBWL(0, 70);
      expect(result.runtimeType, String);
      expect(result, '0.00');
    });

    test('Calculate BWL should return 0.00 when both values are 0', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var result = _calculationService.calculateBWL(0, 0);
      expect(result.runtimeType, String);
      expect(result, '0.00');
    });

    test('Calculate BML should calculate properly', () {
      ICalculationService _calculationService = locator<ICalculationService>();

      var result = _calculationService.calculateBWL(70, 68);
      var result2 = _calculationService.calculateBWL(68, 70);
      expect(result, '2.86');
      expect(result2, '-2.94');
    });

    test('Calculate BML should handle null value', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var result = _calculationService.calculateBWL(null, null);
      expect(result, '0.00');
    });
  });
  group('formatDateToThaiString test', () {
    test(
        // ignore: lines_longer_than_80_chars
        'formatDateToThaiString should be able to format when receive DateTime in Christ year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          date: DateTime(1999, 03, 12), isBuddhist: false);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });

    test(
        // ignore: lines_longer_than_80_chars
        'formatDateToThaiString should be able to format when receive String date in Christ year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          dateString: '1999-03-12', isBuddhist: false);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
    test(
        // ignore: lines_longer_than_80_chars
        'formatDateToThaiString should be able to format when receive DateTime with Buddhist year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          date: DateTime(2542, 03, 12), isBuddhist: true);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
    test(
        // ignore: lines_longer_than_80_chars
        'formatDateToThaiString should be able to format when receieve String date in Buddhist year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var formattedDate = _calculationService.formatDateToThaiString(
          dateString: '2542-03-12', isBuddhist: true);
      expect(formattedDate, 'วันศุกร์ที่ 12 มีนาคม พ.ศ. 2542');
    });
  });

  group('Calculate calculateDayDifference', () {
    test('calculateDayDifference should return correct difference in day', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var dayDifference = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 15), compareTo: DateTime(1999, 03, 12));
      expect(dayDifference, 3);
    });

    test('calculateDayDifference should always return positive number', () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var day1 = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 12), compareTo: DateTime(1999, 03, 13));
      var day2 = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 13), compareTo: DateTime(1999, 03, 12));
      expect(day1, 1);
      expect(day2, 1);
      expect(day1, day2);
    });

    test(
        'calculationDayDifference  should work when input are in buddhist year',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var day1 = _calculationService.formatDate(date: DateTime(1999, 03, 12));
      var day2 = _calculationService.formatDate(date: DateTime(1999, 03, 15));
      var dayDifference = _calculationService.calculateDayDifference(
          day: day1, compareTo: day2);
      expect(dayDifference, 3);
    });

    test('calculationDayDifference should return 0 when dates are the same',
        () {
      ICalculationService _calculationService = locator<ICalculationService>();
      var dayDifference = _calculationService.calculateDayDifference(
          day: DateTime(1999, 03, 12, 17, 30),
          compareTo: DateTime(1999, 03, 12, 22, 30));
      expect(dayDifference, 0);
    });
  });
}
