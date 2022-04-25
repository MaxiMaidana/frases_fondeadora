import '../models/response.dart';
import '../../features/home/domain/entities/qod.dart';

import 'data_source.dart';
import 'package:dio/dio.dart';

class DioDataSource extends DataSource {
  final String _url;
  final Dio _client;
  DioDataSource({required String url, required Dio client})
      : _url = url,
        _client = client;

  @override
  Future<ResponseModel> deleteDataSource() {
    // TODO: implement deleteDataSource
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> getDataSource() async {
    ResponseModel responseModel;
    try {
      final res = await _client.get(_url);
      responseModel =
          ResponseModel(statusCode: res.statusCode!, data: res.data);
      return responseModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel> postDataSource() {
    // TODO: implement postDataSource
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> putDataSource() {
    // TODO: implement putDataSource
    throw UnimplementedError();
  }
}
