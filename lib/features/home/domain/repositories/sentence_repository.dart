import '../entities/qod.dart';

abstract class DSentenceRepository {
  Future<Qod> getSentence();
}
