import '../repositories/auth_repository.dart';

class SignIn {
  final DAuthRepository _authRepository;
  SignIn({required DAuthRepository authRepository})
      : _authRepository = authRepository;

  Future<bool> sigin({required String email, required String pass}) async {
    try {
      bool res = await _authRepository.signIn(email: email, pass: pass);
      return res;
    } catch (e) {
      throw e;
    }
  }
}
