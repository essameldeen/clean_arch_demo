import 'dart:convert';
import 'dart:io';
import 'package:clean_arch_demo/core/apis/api_consumer.dart';
import 'package:clean_arch_demo/core/apis/app_interceptor.dart';
import 'package:clean_arch_demo/injection_container.dart' as di;
import 'package:clean_arch_demo/core/apis/endpoints.dart';
import 'package:clean_arch_demo/core/apis/status_code.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../error/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };

    dio.interceptors.add(di.serviceLocator<AppInterceptor>());
    dio.interceptors.add(di.serviceLocator<LogInterceptor>());
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParamters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParamters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? queryParamters,
      bool formDataIsEnable = false}) async {
    try {
      final response = await dio.post(path,
          queryParameters: queryParamters,
          data: formDataIsEnable ? FormData.fromMap(body!) : body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future put(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParamters) async {
    try {
      final response =
          await dio.put(path, queryParameters: queryParamters, data: body);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    return jsonDecode(response.data.toString());
  }

  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw const NoInternetConnectionException();
    }
  }
}
