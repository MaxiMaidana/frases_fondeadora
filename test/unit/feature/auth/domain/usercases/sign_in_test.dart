import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/features/auth/domain/repositories/auth_repository.dart';
import 'package:fondeadora_frase/features/auth/domain/usercases/sign_in.dart';
import '../../../../data/respository/auth_repository_test.dart';

void main() {
  group('Auth usercases', () {
    test('The user can Authenticate her credentials', () async {
      SignIn signInUserCases = MockSignIn(repository: MockAuthRepository());
      bool res =
          await signInUserCases.sigin(email: 'asd@asd.com', pass: 'Asd1234.');
      expect(res, true);
    });
    test('The user cant Authenticate, because her pass is bad', () async {
      SignIn signInUserCases = MockSignIn(repository: MockAuthRepository());
      bool res =
          await signInUserCases.sigin(email: 'asd@asd.com', pass: 'Asd1234..');
      expect(res, false);
    });
    test('The user can Authenticate, because her email is bad', () async {
      SignIn signInUserCases = MockSignIn(repository: MockAuthRepository());
      bool res =
          await signInUserCases.sigin(email: 'asdd@asd.com', pass: 'Asd1234.');
      expect(res, false);
    });
  });
}

class MockSignIn implements SignIn {
  final DAuthRepository repository;

  MockSignIn({required this.repository});

  @override
  Future<bool> sigin({required String email, required String pass}) async {
    bool res = await repository.signIn(email: email, pass: pass);
    return res;
  }
}
