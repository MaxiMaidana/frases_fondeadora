import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/core/utils/email_helper.dart';

void main() {
  group('Email', () {
    test('The email is correctly , it is true', () {
      final passwordHelper = EmailHelper();
      expect(passwordHelper.isValidEmail('maxi@gmail.com'), true);
    });
    test('The email is not correctly , it is false', () {
      final passwordHelper = EmailHelper();
      expect(passwordHelper.isValidEmail('maxi.com'), false);
    });
  });
}
