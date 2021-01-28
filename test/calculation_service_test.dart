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
}
