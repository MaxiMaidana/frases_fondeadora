import 'quote.dart';

abstract class Contents {
  Contents({
    this.quotes,
  });

  final List<Quote>? quotes;
}
