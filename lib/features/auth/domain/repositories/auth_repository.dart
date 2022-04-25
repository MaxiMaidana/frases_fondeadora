abstract class DAuthRepository {
  Future<bool> signIn({required String email, required String pass});
}
