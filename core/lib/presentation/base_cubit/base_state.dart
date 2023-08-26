import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

abstract class RenderBaseState<T> extends BaseState {
  final T stateData;
  final StateStatus stateStatus;

  const RenderBaseState({
    required this.stateData,
    this.stateStatus = StateStatus.init,
  });

  @override
  List<Object?> get props => [
        stateStatus,
        stateData,
      ];
}

abstract class ListenerBaseState extends BaseState {
  @override
  List<Object?> get props => [];
}

enum StateStatus {
  init,
  progress,
  complete,
  error,
}
