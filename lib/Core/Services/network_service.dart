import 'dart:io';

import '../../../Core/Helpers/dependency_injection_helper.dart';
import '../../../Core/Services/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

/// Used to handle the network clients all over the app
class NetworkService {
  Dio publicDio;
  Dio privateDio;

  NetworkService({
    required this.publicDio,
    required this.privateDio,
  });

  /// Initializing interceptors to be able to check network calls and handle errors
  initializeInterceptors() {
    privateDio.interceptors.clear();
    publicDio.interceptors.clear();

    (publicDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      SecurityContext context = SecurityContext();
      var client = HttpClient(context: context);
      client.badCertificateCallback = (cert, host, port) => false;

      return client;
    };

    (privateDio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () {
      SecurityContext context = SecurityContext();
      var client = HttpClient(context: context);
      client.badCertificateCallback = (cert, host, port) => false;

      return client;
    };

    publicDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Content-Type'] = "application/json";
          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          debugPrint(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('-----------------------------------------------');
        },
      ),
    );

    privateDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] =
              'Bearer ${DependencyInjectionHelper().sl<AuthService>().userToken}';
          options.headers['Content-Type'] = "application/json";
          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('Data: ${options.data}');
          debugPrint('-----------------------------------------------');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          debugPrint(response.data.toString());
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');
          debugPrint('-----------------------------------------------');
        },
      ),
    );
  }
}
