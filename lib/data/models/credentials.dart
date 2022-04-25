import 'dart:convert';

import '../../features/auth/domain/entities/credential.dart';
import '../../features/auth/domain/entities/credentials.dart';
import 'credential.dart';

class CredentialsModel implements Credentials {
  CredentialsModel({
    this.credentials,
  });

  @override
  List<Credential>? credentials;
  // @override
  // List<CredentialModel>? credentialss;

  factory CredentialsModel.fromRawJson(String str) =>
      CredentialsModel.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  factory CredentialsModel.fromJson(Map<String, dynamic> json) =>
      CredentialsModel(
        credentials: json["credentials"] == null
            ? null
            : List<CredentialModel>.from(
                json["credentials"].map((x) => CredentialModel.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "credentials": credentials == null
  //           ? null
  //           : List<dynamic>.from(credentials!.map((x) => x.toJson())),
  //     };

}
