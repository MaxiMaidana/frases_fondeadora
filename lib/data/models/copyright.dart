import 'dart:convert';

import '../../features/home/domain/entities/copytight.dart';

class CopyrightModel implements Copyright {
  CopyrightModel({
    this.year,
    this.url,
  });

  @override
  int? year;

  @override
  String? url;

  factory CopyrightModel.fromRawJson(String str) =>
      CopyrightModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CopyrightModel.fromJson(Map<String, dynamic> json) => CopyrightModel(
        year: json["year"] == null ? null : json["year"]!,
        url: json["url"] == null ? null : json["url"]!,
      );

  Map<String, dynamic> toJson() => {
        "year": year == null ? null : year!,
        "url": url == null ? null : url!,
      };
}
