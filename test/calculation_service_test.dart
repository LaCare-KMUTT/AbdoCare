import 'package:AbdoCare/services/calculation_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calculateAge should be able to calculate', () {
    final _calculationService = CalculationService();
    var age = _calculationService.calculateAge(DateTime(1999, 03, 12));
    expect(age, 21);
  });

  test('calculate BMI should be correct', () {
    final _calculationService = CalculationService();
    var bmi = _calculationService.calculateBMI(70, 170);
    expect(bmi, "24.22");
  });
}
