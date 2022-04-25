import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../features/auth/domain/repositories/auth_repository.dart';
import '../datasource/data_source.dart';
import '../models/credentials.dart';
import '../models/response.dart';

class AuthRepository implements DAuthRepository {
  final DataSource _dataSource;
  AuthRepository({required DataSource dataSource}) : _dataSource = dataSource;
  @override
  Future<bool> signIn({required String email, required String pass}) async {
    try {
      final data = await rootBundle.loadString('data_fake/credentials.json');
      Map<String, dynamic> dataMap = json.decode(data);
      CredentialsModel credentialModels = CredentialsModel.fromJson(dataMap);
      for (int i = 0; i < credentialModels.credentials!.length; i++) {
        if (credentialModels.credentials![i].email == email &&
            credentialModels.credentials![i].password == pass) {
          return true;
        }
      }
      return false;
    } catch (e) {
      if (e is DioError) {
        throw ResponseModel(statusCode: 403, data: false);
      } else {
        rethrow;
      }
    }
  }
}
