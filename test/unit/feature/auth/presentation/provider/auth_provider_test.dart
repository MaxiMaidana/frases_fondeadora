import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/data/repository/auth_repository.dart';
import 'package:fondeadora_frase/features/auth/presentation/providers/auth_provider.dart';

import '../../../../data/respository/auth_repository_test.dart';
import '../../domain/usercases/sign_in_test.dart';

void main() {
  final authProvider = AuthProvider();
  group('AuthProvider', () {
    test('change the value of validateCredential', () {
      authProvider.updateValidCredential(true);
      expect(authProvider.validCredential, true);
    });
    test('change the value of isLoading', () {
      authProvider.updateValidLoading(true);
      expect(authProvider.isLoading, true);
    });
    test('uploaded credentials are good', () {
      authProvider.areValidCredentials('asd@asd.com', 'Asd1234.');
      expect(authProvider.validCredential, true);
    });
    test('uploaded credentials are bad because the email is not correct', () {
      authProvider.areValidCredentials('asddasd.com', 'Asd1234.');
      expect(authProvider.validCredential, false);
    });
    test('uploaded credentials are bad because the pass is not correct', () {
      authProvider.areValidCredentials('asd@asd.com', 'Asd1234');
      expect(authProvider.validCredential, false);
    });
    test('signIn', () async {
      bool res = await MockAuthProvider()
          .signIn(email: 'asd@asd.com', pass: 'Asd1234.');
      expect(res, true);
    });
  });
}

class MockAuthProvider implements AuthProvider {
  @override
  Future<bool> signIn({required String email, required String pass}) async {
    return await MockSignIn(repository: MockAuthRepository())
        .sigin(email: email, pass: pass);
  }

  @override
  bool isLoading = false;

  @override
  bool validCredential = false;

  @override
  void addListener(VoidCallback listener) {}

  @override
  void areValidCredentials(String email, String pass) {}

  @override
  void dispose() {}

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  AuthRepository get repository => throw UnimplementedError();

  @override
  void updateValidCredential(bool value) {}

  @override
  void updateValidLoading(bool value) {}
}
