import 'package:dio/dio.dart';
import '../../../../data/datasource/dio_data_source.dart';
import '../../../../data/repository/sentence_repository.dart';
import '../entities/qod.dart';
import '../usecases/get_sentence.dart';

class SentenceApi {
  ///Metodo para traer las frases
  ///
  ///Utilizo asi de esta manera, ya que es correcto pasar en la capa de dominio
  ///la url que se esta llamando ni el repositorio
  ///
  ///De esta manera todo lo que tiene que ver con los llamados queda encapsulado en esta capa.

  Future<Qod> getSentence() async {
    try {
      final repository = SentenceRepository(
        dataSource: DioDataSource(
          client: Dio(),
          url: 'https://quotes.rest/qod?language=en',
        ),
      );
      Qod sentence = await GetSentence(repository: repository).call();
      return sentence;
    } catch (e) {
      throw e;
    }
  }
}
