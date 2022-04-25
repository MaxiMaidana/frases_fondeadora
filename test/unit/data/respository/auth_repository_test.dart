import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/data/models/credentials.dart';
import 'package:fondeadora_frase/features/auth/domain/entities/credential.dart';
import 'package:fondeadora_frase/features/auth/domain/repositories/auth_repository.dart';

void main() {
  group('Auth Repository', () {
    test('The user can Authenticate her credentials', () async {
      final DAuthRepository repository = MockAuthRepository();
      bool res =
          await repository.signIn(email: 'asd@asd.com', pass: 'Asd1234.');
      expect(res, true);
    });
    test(
        'The user cant Authenticate her credentials, because the password is bad',
        () async {
      final DAuthRepository repository = MockAuthRepository();
      bool res =
          await repository.signIn(email: 'asd@asd.com', pass: 'Asd1234.1');
      expect(res, false);
    });
    test('The user cant Authenticate her credentials, because the email is bad',
        () async {
      final DAuthRepository repository = MockAuthRepository();
      bool res =
          await repository.signIn(email: 'asdd@asd.com', pass: 'Asd1234.');
      expect(res, false);
    });
  });
}

class MockAuthRepository implements DAuthRepository {
  @override
  Future<bool> signIn({required String email, required String pass}) async {
    List<Credential> lsCredential = CredentialsModel.fromJson({
      "credentials": [
        {"email": "asd@asd.com", "password": "Asd1234."},
        {"email": "maxi@maidana.com", "password": "Maxi1234."},
        {"email": "maidana@maxi.com", "password": "Mai1234."}
      ]
    }).credentials!;
    for (int i = 0; i < lsCredential.length; i++) {
      if (lsCredential[i].email == email && lsCredential[i].password == pass) {
        return true;
      }
    }
    return false;
  }
}
