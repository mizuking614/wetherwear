import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository.g.dart';

@riverpod
ApiCliant apicliant(Ref ref) {
  return ApiCliant();
}

class ApiCliant {
  final Dio _dio;
  ApiCliant() : _dio = Dio() {
    _dio.options.baseUrl = 'https://api.open-meteo.com/v1';
  }

  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.message ?? e.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
