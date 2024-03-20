import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class RemoteDataSource {
  final _dio = GetIt.I.get<Dio>();

  Future<Response> get({required String endpoint}) async {
    try {
      final response = await _dio.get('$endpoint?api_key=${dotenv.env['API_KEY']}');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
