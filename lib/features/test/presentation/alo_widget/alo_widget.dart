import 'package:flutter/material.dart';
import 'package:core/core.dart';

import 'cubit/alo_cubit.dart';

class Alowidget extends BaseScreen {
  const Alowidget({Key? key}) : super(key: key);

  @override
  State<Alowidget> createState() => AlowidgetState();
}

class AlowidgetState extends BaseScreenState<Alowidget,
    AloState,
    AloCubit,
    AloListenState,
    AloRenderState> {
  @override
  void initCubit() {}

  @override
  void listener(BuildContext context, AloListenState listenState) {}

  @override
  Widget render(BuildContext context, AloRenderState renderState) {
    return Container();
  }
}
