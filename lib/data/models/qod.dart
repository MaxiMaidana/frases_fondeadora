import 'dart:convert';

import '../../features/home/domain/entities/copytight.dart';
import '../../features/home/domain/entities/contents.dart';
import '../../features/home/domain/entities/qod.dart';
import '../../features/home/domain/entities/success.dart';

import 'contents.dart';
import 'copyright.dart';
import 'success.dart';

class QodModel implements Qod {
  QodModel({
    this.success,
    this.contents,
    this.baseurl,
    this.copyright,
  });

  @override
  final SuccessModel? success;
  @override
  final ContentsModel? contents;
  @override
  final String? baseurl;
  @override
  final CopyrightModel? copyright;

  factory QodModel.fromRawJson(String str) =>
      QodModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QodModel.fromJson(Map<String, dynamic> json) => QodModel(
        success: json["success"] == null
            ? null
            : SuccessModel.fromJson(json["success"]),
        contents: json["contents"] == null
            ? null
            : ContentsModel.fromJson(json["contents"]),
        baseurl: json["baseurl"] == null ? null : json["baseurl"]!,
        copyright: json["copyright"] == null
            ? null
            : CopyrightModel.fromJson(json["copyright"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success!.toJson(),
        "contents": contents == null ? null : contents!.toJson(),
        "baseurl": baseurl == null ? null : baseurl!,
        "copyright": copyright == null ? null : copyright!.toJson(),
      };

  @override
  set baseurl(String? _baseurl) {
    // TODO: implement baseurl
  }

  @override
  set contents(Contents? _contents) {
    // TODO: implement contents
  }

  @override
  set copyright(Copyright? _copyright) {
    // TODO: implement copyright
  }

  @override
  set success(Success? _success) {
    // TODO: implement success
  }
}
