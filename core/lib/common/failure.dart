import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;

  const Failure({this.message});

  @override
  List<Object?> get props => [
        message,
      ];

  @override
  String toString() {
    super.toString();
    return runtimeType.toString() + (message ?? " Cannot catch error");
  }
}

abstract class FeatureError extends Failure {
  const FeatureError();
}

class UnCatchError extends Failure {}

class ServerError extends Failure {}
