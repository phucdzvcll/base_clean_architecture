import 'package:core/common/mapper.dart';
import 'package:flutter_clean_architecture/features/test/data/models/test_model.dart';
import 'package:flutter_clean_architecture/features/test/domain/entities/test_entity.dart';

class TestMapper extends Mapper<TestRemoteModel, TestEntity> {
  @override
  TestEntity map(TestRemoteModel input) {
    return TestEntity();
  }
}
