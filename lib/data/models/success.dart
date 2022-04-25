import 'dart:convert';

import '../../features/home/domain/entities/success.dart';

class SuccessModel implements Success {
  SuccessModel({
    this.total,
  });

  @override
  int? total;

  factory SuccessModel.fromRawJson(String str) =>
      SuccessModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuccessModel.fromJson(Map<String, dynamic> json) => SuccessModel(
        total: json["total"] == null ? null : json["total"]!,
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total!,
      };
}
