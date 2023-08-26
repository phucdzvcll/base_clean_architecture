import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_clean_architecture/features/test/presentation/test_screen/bloc/test_bloc.dart';

class TestScreen extends BaseScreen {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => TestScreenState();
}

class TestScreenState extends BaseScreenState<TestScreen, TestState, TestCubit,
    TestListenState, TestRenderState> {
  @override
  void initCubit() {}

  @override
  void listener(BuildContext context, TestListenState listenState) {}

  @override
  Widget render(BuildContext context, TestRenderState renderState) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          Center(
            child: Text(
              renderState.stateData.count.toString(),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                cubit.count();
              },
              child: const Text("Count"),
            ),
          ),
        ],
      ),
    );
  }
}
