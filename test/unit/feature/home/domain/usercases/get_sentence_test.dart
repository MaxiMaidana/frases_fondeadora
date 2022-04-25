import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/data/models/contents.dart';
import 'package:fondeadora_frase/data/models/copyright.dart';
import 'package:fondeadora_frase/data/models/qod.dart';
import 'package:fondeadora_frase/data/models/quote.dart';
import 'package:fondeadora_frase/data/models/success.dart';
import 'package:fondeadora_frase/features/home/domain/entities/qod.dart';
import 'package:fondeadora_frase/features/home/domain/repositories/sentence_repository.dart';
import 'package:fondeadora_frase/features/home/domain/usecases/get_sentence.dart';
import '../../../../data/respository/sentence_repository_test.dart';

void main() {
  group('Get Sentence usercases', () {
    test('The result of GetSentence is not null', () async {
      GetSentence getSentenceUserCases =
          MockGetSentence(repository: MockSentenceRepository());
      Qod res = await getSentenceUserCases.call();
      expect(res != null, true);
    });
  });
}

class MockGetSentence implements GetSentence {
  final DSentenceRepository repository;

  MockGetSentence({required this.repository});

  @override
  Future<Qod> call() async {
    Qod res = await repository.getSentence();
    return res;
  }
}
