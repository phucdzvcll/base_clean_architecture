import 'package:core/core.dart';
import 'package:flutter_clean_architecture/app/interceptors/main_network_interceptor.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MainNetWorkConfig extends NetworkApiConfig {
  final MainNetworkInterceptor mainNetworkInterceptor;

  MainNetWorkConfig(
    super.mode, {
    required this.mainNetworkInterceptor,
  });

  @override
  void init() {
    dio.options.baseUrl = getBaseUrl();
    dio.interceptors.add(mainNetworkInterceptor);
  }

  @override
  String getBaseUrl() {
    switch (mode) {
      case BuildMode.dev:
      case BuildMode.prod:
      case BuildMode.stag:
      default:
        return "";
    }
  }
}
