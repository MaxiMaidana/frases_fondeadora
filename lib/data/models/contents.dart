import 'dart:convert';

import '../../features/home/domain/entities/contents.dart';
import 'quote.dart';

class ContentsModel implements Contents {
  ContentsModel({
    this.quotes,
  });

  @override
  List<QuoteModel>? quotes;

  factory ContentsModel.fromRawJson(String str) =>
      ContentsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContentsModel.fromJson(Map<String, dynamic> json) => ContentsModel(
        quotes: json["quotes"] == null
            ? null
            : QuoteModel.listFromJson(json["quotes"]),
      );

  Map<String, dynamic> toJson() => {
        "quotes": quotes == null
            ? null
            : List<dynamic>.from(quotes!.map((x) => x.toJson())),
      };
}
