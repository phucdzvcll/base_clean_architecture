import 'package:core/build_config/build_config.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'constants.dart';

abstract class NetworkApiConfig {
  final BuildMode mode;
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 300),
      receiveTimeout: const Duration(seconds: 300),
      sendTimeout: const Duration(seconds: 300),
      headers: {
        'Accept': SupportedContentType.jsonContentType,
        'Content-Type': SupportedContentType.jsonContentType,
      },
    ),
  );

  final Dio? tokenDio;

  NetworkApiConfig(this.mode, {this.tokenDio}) {
    init();
    _logging();
  }

  void init();

  void _logging() {
    if (!kReleaseMode) {
      dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }
  }

  void close({bool force = false}) {
    dio.close(force: force);
  }

  String getBaseUrl();
}
