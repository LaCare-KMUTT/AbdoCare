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
    expect(age, 21);
  });

  test('calculate BMI should be correct', () {
    ICalculationService _calculationService = locator<ICalculationService>();
    var bmi = _calculationService.calculateBMI(70, 170);
    expect(bmi, "24.22");
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
}
