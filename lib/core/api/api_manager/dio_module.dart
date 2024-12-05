import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:listie/core/api/api_constants.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio providerDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
      ),
    );
    dio.options.headers = {
      'Content-Type': 'application/json',
    };
    return dio;
  }
}
