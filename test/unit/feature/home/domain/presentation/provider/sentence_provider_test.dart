import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fondeadora_frase/features/home/domain/entities/qod.dart';
import 'package:fondeadora_frase/features/home/presentation/provider/sentence_provider.dart';

import '../../../../../data/respository/sentence_repository_test.dart';
import '../../usercases/get_sentence_test.dart';

void main() {
  final sentenceProvider = SentenceProvider();
  group('sentenceProvider', () {
    test('the origin state is initial of state', () {
      expect(sentenceProvider.state, StateSentence.initial);
    });
    test('the origin value is false of charge', () {
      expect(sentenceProvider.charge, false);
    });
    test('change status of state for loading', () {
      sentenceProvider.updateSentence(StateSentence.loading);
      expect(sentenceProvider.state, StateSentence.loading);
    });
    test('change status of state for available', () {
      sentenceProvider.updateSentence(StateSentence.available);
      expect(sentenceProvider.state, StateSentence.available);
    });
    test('change status of state for error', () {
      sentenceProvider.updateSentence(StateSentence.error);
      expect(sentenceProvider.state, StateSentence.error);
    });
    test('update state of chanto for true', () {
      sentenceProvider.updateCharge(true);
      expect(sentenceProvider.charge, true);
    });
    test('update sentence', () async {
      final mockSentenceProvider = MockSentenceProvider();
      await mockSentenceProvider.callSentence();
      expect(mockSentenceProvider.sentence, 'frase1');
    });
  });
}

class MockSentenceProvider implements SentenceProvider {
  @override
  bool charge = false;

  @override
  String sentence = '';

  @override
  StateSentence state = StateSentence.initial;

  @override
  Future<void> callSentence() async {
    Qod sentencee =
        await MockGetSentence(repository: MockSentenceRepository()).call();
    sentence = sentencee.contents!.quotes!.first.quote!;
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  void dispose() {}

  @override
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}

  @override
  void updateCharge(bool value) {}

  @override
  void updateSentence(StateSentence value) {}
}
