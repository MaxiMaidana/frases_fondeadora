import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/core/utils/password_helper.dart';

void main() {
  group('Password', () {
    test(
        'The password has a minimum of 8 characters, 1 special character, 1 number and 1 capital letter , it is true',
        () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.isValidPassword('Hola1234.'), true);
    });
    test('The password doesnt have 8 characters, it is false', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.isValidPassword('Hola'), false);
    });
    test('The password does not have all the specifications., it is false', () {
      final passwordHelper = PasswordHelper();
      expect(passwordHelper.isValidPassword('Hola123'), false);
    });
  });
}
