import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/data/models/contents.dart';
import 'package:fondeadora_frase/data/models/copyright.dart';
import 'package:fondeadora_frase/data/models/qod.dart';
import 'package:fondeadora_frase/data/models/quote.dart';
import 'package:fondeadora_frase/data/models/success.dart';
import 'package:fondeadora_frase/data/repository/sentence_repository.dart';

void main() {
  group('Auth Repository', () {
    test('The user can Authenticate her credentials', () async {
      final QodModel repository = await MockSentenceRepository().getSentence();
      expect(repository.contents!.quotes!.isNotEmpty, true);
    });
  });
}

class MockSentenceRepository implements SentenceRepository {
  @override
  Future<QodModel> getSentence() async {
    return QodModel(
      baseurl: '',
      contents: ContentsModel(quotes: [
        QuoteModel(quote: 'frase1'),
        QuoteModel(quote: 'frase2'),
        QuoteModel(quote: 'frase3'),
      ]),
      copyright: CopyrightModel(),
      success: SuccessModel(),
    );
  }
}
