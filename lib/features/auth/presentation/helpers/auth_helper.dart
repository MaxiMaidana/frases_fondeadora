import 'package:flutter/material.dart';

import '../providers/auth_provider.dart';

class AuthHelper {
  ///Helper que sirve para validar si pudimos o no iniciar sesion.
  ///
  ///En el caso positivo, nos lleva a la pagina /home.
  ///
  ///Caso contrario nos quedamos en esta pagina.
  Future<void> authFunction(
      BuildContext context, String email, String pass) async {
    if (await context.read<AuthProvider>().signIn(email: email, pass: pass)) {
      Navigator.of(context).pushNamed('/home');
    }
  }
}
