import 'package:core/presentation/base_cubit/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S extends BaseState, R extends RenderBaseState,
    L extends ListenerBaseState> extends Cubit<S> {
  late R currentRenderState;

  BaseCubit(S initialState) : super(initialState) {
    currentRenderState = initialState as R;
  }

  @override
  void onChange(Change<S> change) {
    super.onChange(change);
    if (change.nextState is R) {
      currentRenderState = change.nextState as R;
    }
  }
}
