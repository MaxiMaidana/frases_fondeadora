import 'package:dio/dio.dart';

import '../../features/home/domain/repositories/sentence_repository.dart';
import '../datasource/data_source.dart';
import '../models/qod.dart';
import '../models/response.dart';

class SentenceRepository implements DSentenceRepository {
  final DataSource _dataSource;
  SentenceRepository({required DataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future<QodModel> getSentence() async {
    try {
      ResponseModel res = await _dataSource.getDataSource();
      return QodModel.fromJson(res.data as Map<String, dynamic>);
    } catch (e) {
      if (e is DioError) {
        throw ResponseModel(
            statusCode: e.response!.statusCode!,
            data: e.response!.statusMessage!);
      } else {
        rethrow;
      }
    }
  }
}
