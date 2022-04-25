import '../../features/auth/domain/entities/credential.dart';
import 'dart:convert';

class CredentialModel implements Credential {
  CredentialModel({
    this.email,
    this.password,
  });

  @override
  String? email;
  @override
  String? password;

  factory CredentialModel.fromRawJson(String str) =>
      CredentialModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      CredentialModel(
        email: json["email"] == null ? null : json["email"]!,
        password: json["password"] == null ? null : json["password"]!,
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email!,
        "password": password == null ? null : password!,
      };
}
