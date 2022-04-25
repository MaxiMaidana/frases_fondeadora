abstract class Quote {
  Quote({
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

  String? quote;
  String? length;
  String? author;
  List<String>? tags;
  String? category;
  String? language;
  DateTime? date;
  String? permalink;
  String? id;
  String? background;
  String? title;
}
