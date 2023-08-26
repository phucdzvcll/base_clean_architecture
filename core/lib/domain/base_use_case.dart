import 'package:core/common/failure.dart';
import 'package:either_dart/either.dart';

abstract class BaseUseCase<P, R> {
  Future<Either<R, Failure>> call(P param);
}

abstract class BaseUseCaseNoParam<R> {
  Future<Either<R, Failure>> call();
}

abstract class BaseCompleteUseCase<P> {
  Future<void> call(P param);
}
