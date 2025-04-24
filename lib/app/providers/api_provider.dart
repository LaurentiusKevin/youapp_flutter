import 'package:dio/dio.dart';

class ApiProvider {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://techtest.youapp.ai/api',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Dio get client => _dio;
}
