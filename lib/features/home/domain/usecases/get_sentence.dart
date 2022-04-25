import '../entities/qod.dart';
import '../repositories/sentence_repository.dart';

class GetSentence {
  final DSentenceRepository _repository;
  GetSentence({required DSentenceRepository repository})
      : _repository = repository;

  Future<Qod> call() async {
    try {
      return await _repository.getSentence();
    } catch (e) {
      throw e;
    }
  }
}
