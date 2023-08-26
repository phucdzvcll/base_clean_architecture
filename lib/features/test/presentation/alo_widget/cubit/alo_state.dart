part of 'alo_cubit.dart';

class AloState extends BaseState {}

class AloListenState extends ListenerBaseState implements AloState {}

class AloRenderState extends RenderBaseState<AloStateData>
    implements AloState {
  const AloRenderState({
    required super.stateData,
  });

  factory AloRenderState.init() =>
      const AloRenderState(stateData: AloStateData());

  AloRenderState copyWith() {
    return AloRenderState(
      stateData: stateData.copyWith(),
    );
  }
}

class AloStateData {
  const AloStateData();


  AloStateData copyWith() {
    return AloStateData();
  }
}
