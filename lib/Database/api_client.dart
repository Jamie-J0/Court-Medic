import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient({Dio? dio}) : _dio = dio ?? Dio();

  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    Options? options,
  }) {
    return _dio.post(path, data: data, options: options);
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get(path, queryParameters: queryParameters, options: options);
  }
}
