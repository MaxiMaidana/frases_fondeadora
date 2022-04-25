import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../domain/api/auth_api.dart';
import '../../../../data/datasource/dio_data_source.dart';
import '../../../../data/repository/auth_repository.dart';
import '../../../../core/utils/email_helper.dart';
import '../../../../core/utils/password_helper.dart';
export 'package:provider/src/provider.dart';

class AuthProvider extends ChangeNotifier {
  bool validCredential = false;
  bool isLoading = false;

  final repository = AuthRepository(
    dataSource: DioDataSource(
      client: Dio(),
      url: '',
    ),
  );

  ///Metodo que sirve para actualizar la varialbe ValidCredential
  void updateValidCredential(bool value) {
    validCredential = value;
    notifyListeners();
  }

  ///Metodo que sirve para actualizar la varialbe isLoading
  void updateValidLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  ///Metodo que sirve que sirve para saber si un email y una password cumplen con los requisitos.
  void areValidCredentials(String email, String pass) {
    if (EmailHelper().isValidEmail(email) &&
        PasswordHelper().isValidPassword(pass)) {
      updateValidCredential(true);
    } else {
      updateValidCredential(false);
    }
  }

  ///Metodo para iniciar sesion.
  Future<bool> signIn({required String email, required String pass}) async {
    try {
      updateValidLoading(true);
      await Future.delayed(const Duration(seconds: 3));
      bool authOkey = await AuthApi().signIn(email: email, pass: pass);
      updateValidLoading(false);
      return authOkey;
    } catch (e) {
      return false;
    }
  }
}
