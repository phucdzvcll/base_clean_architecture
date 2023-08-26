part of 'test_bloc.dart';

class TestState extends BaseState {}

class TestListenState extends ListenerBaseState implements TestState {}

class TestRenderState extends RenderBaseState<TestStateData>
    implements TestState {
  const TestRenderState({
    required super.stateData,
  });

  factory TestRenderState.init() =>
      const TestRenderState(stateData: TestStateData());

  TestRenderState copyWith(
    int? count,
  ) {
    return TestRenderState(
      stateData: stateData.copyWith(count: count),
    );
  }
}

class TestStateData {
  const TestStateData({
    this.count = 0,
  });

  final int count;

  TestStateData copyWith({
    final int? count,
  }) {
    return TestStateData(
      count: count ?? this.count,
    );
  }
}
