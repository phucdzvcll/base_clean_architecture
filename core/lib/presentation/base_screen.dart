import 'package:core/presentation/base_cubit/base_cubit.dart';
import 'package:core/presentation/base_cubit/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState();
}

abstract class BaseScreenState<
        T extends StatefulWidget,
        S extends BaseState,
        C extends BaseCubit<S, R, L>,
        L extends ListenerBaseState,
        R extends RenderBaseState> extends State<T>
    with AutomaticKeepAliveClientMixin {
  late final C cubit;

  @override
  bool get wantKeepAlive => false;

  bool get wantKeepBloc => false;

  @override
  void initState() {
    super.initState();
    cubit = GetIt.instance.get();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initCubit();
    });
    initCubit();
  }

  @mustCallSuper
  void initCubit();

  bool buildWhen(S currentState, S nextState) {
    return currentState is RenderBaseState;
  }

  bool listenWhen(S currentState, S nextState) {
    return currentState is ListenerBaseState;
  }

  void listener(BuildContext context, L listenState);

  @mustCallSuper
  Widget render(BuildContext context, R renderState);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider<C>.value(
      value: cubit,
      child: BlocConsumer<C, S>(
        buildWhen: buildWhen,
        listenWhen: listenWhen,
        listener: (context, state) {
          if (state is L) {
            listener(context, state);
          }
        },
        builder: (context, state) {
          if (state is R) {
            return render(context, state);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
