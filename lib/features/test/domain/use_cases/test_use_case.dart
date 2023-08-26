import 'package:core/core.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_clean_architecture/features/test/domain/entities/test_entity.dart';
import 'package:flutter_clean_architecture/features/test/domain/repositories/test_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class TestUseCase extends BaseUseCase<TestEntity, TestParam> {
  final TestRepository testRepository;

  TestUseCase({required this.testRepository});

  @override
  Future<Either<TestParam, Failure>> call(TestEntity param) {
    throw UnimplementedError();
  }
}

class TestParam {}
