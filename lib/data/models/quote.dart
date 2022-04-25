import 'dart:convert';

import '../../features/home/domain/entities/quote.dart';

class QuoteModel implements Quote {
  QuoteModel({
    this.quote,
    this.length,
    this.author,
    this.tags,
    this.category,
    this.language,
    this.date,
    this.permalink,
    this.id,
    this.background,
    this.title,
  });

  @override
  String? quote;
  @override
  String? length;
  @override
  String? author;
  @override
  List<String>? tags;
  @override
  String? category;
  @override
  String? language;
  @override
  DateTime? date;
  @override
  String? permalink;
  @override
  String? id;
  @override
  String? background;
  @override
  String? title;
  @override
  factory QuoteModel.fromRawJson(String str) =>
      QuoteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  static List<QuoteModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => QuoteModel.fromJson(value)).toList();
  }

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
        quote: json["quote"] == null ? null : json["quote"]!,
        length: json["length"] == null ? null : json["length"]!,
        author: json["author"] == null ? null : json["author"]!,
        // tags: json["tags"] == null
        //     ? null
        //     :
        //     // json["tags"]!,

        //     json["tags"]!.map((value) => value).toList(),
        // List<String>.from(json["tags"].map((x) => x)).toList(),
        category: json["category"] == null ? null : json["category"]!,
        language: json["language"] == null ? null : json["language"]!,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        permalink: json["permalink"] == null ? null : json["permalink"]!,
        id: json["id"] == null ? null : json["id"]!,
        background: json["background"] == null ? null : json["background"]!,
        title: json["title"] == null ? null : json["title"]!,
      );

  Map<String, dynamic> toJson() => {
        "quote": quote == null ? null : quote!,
        "length": length == null ? null : length!,
        "author": author == null ? null : author!,
        "tags": tags == null ? null : List<dynamic>.from(tags!.map((x) => x)),
        "category": category == null ? null : category!,
        "language": language == null ? null : language!,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "permalink": permalink == null ? null : permalink!,
        "id": id == null ? null : id!,
        "background": background == null ? null : background!,
        "title": title == null ? null : title!,
      };
}
