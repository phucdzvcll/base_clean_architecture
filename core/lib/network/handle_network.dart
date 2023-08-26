import 'package:dio/dio.dart';

Future<NetworkResult<T>> handleNetworkResult<T>(
  Future<T> request,
) async {
  try {
    final dynamic response = await request;
    if (response is T) {
      return NetworkResult<T>(response: response);
    }
    throw Exception();
  } on DioException catch (e) {
    NetworkResult<T> networkResult;

    switch (e.type) {
      case DioExceptionType.cancel:
        networkResult = NetworkResult<T>(error: NetworkError.cancel);
        break;
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
        networkResult = NetworkResult<T>(error: NetworkError.connectIssue);
        break;
      case DioExceptionType.receiveTimeout:
        networkResult = NetworkResult<T>(error: NetworkError.receiveIssue);
        break;
      case DioExceptionType.badResponse:
        networkResult = NetworkResult<T>(error: NetworkError.badResponse);
        break;
      case DioExceptionType.unknown:
      default:
        networkResult = NetworkResult<T>(error: NetworkError.unKnowError);
        break;
    }
    return networkResult;
  }
}

enum NetworkError {
  connectIssue,
  serverIssue,
  receiveIssue,
  badResponse,
  cancel,
  internalIssue,
  unKnowError,
}

class NetworkResult<T> {
  final T? response;
  final NetworkError? error;
  final int? errorCode;

  NetworkResult({
    this.response,
    this.error,
    this.errorCode,
  });

  bool isSuccess() {
    return response != null;
  }

  bool isError() {
    return error != null;
  }
}
