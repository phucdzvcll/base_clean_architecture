import 'package:core/presentation/base_cubit/base_cubit.dart';
import 'package:core/presentation/base_cubit/base_state.dart';
import 'package:injectable/injectable.dart';

part 'test_state.dart';

@Injectable()
class TestCubit extends BaseCubit<TestState, TestRenderState, TestListenState> {
  TestCubit() : super(TestRenderState.init());

  void count() {
    emit(currentRenderState.copyWith(currentRenderState.stateData.count + 1));
  }
}
