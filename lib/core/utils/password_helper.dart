class PasswordHelper {
  /// Helper que sirve para validar si una password Tine:
  ///
  /// Letras mayusculas
  /// Letras minusculas
  /// Caracteres especiales (#,!,.,etc)
  bool isValidPassword(String password) {
    String pattern =
        r'^(?=(?:.*\d))(?=.*[A-Z])(?=.*[a-z])(?=.*[}{°.,:*!?¿¡/#$%&\[\]\\\(\)\_;-])\S{8,32}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(password);
  }
}
