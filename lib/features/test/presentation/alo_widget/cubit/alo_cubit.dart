import 'package:core/core.dart';
import 'package:injectable/injectable.dart';

part 'alo_state.dart';

@Injectable()
class AloCubit extends BaseCubit<AloState, AloRenderState, AloListenState> {
  AloCubit() : super(AloRenderState.init());
}
