import 'package:dio/dio.dart';

class ServerError implements Exception {
  String? serverMessage;
  int? statusCode;
  ServerError(this.statusCode, this.serverMessage);
}

class HttpException implements Exception {
  DioException? exception;

  HttpException(this.exception);
}

class NoInternetError implements Exception {}
