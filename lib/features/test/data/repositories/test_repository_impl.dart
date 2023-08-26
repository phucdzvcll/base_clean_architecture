


import 'package:injectable/injectable.dart';
import 'package:flutter_clean_architecture/features/test/data/data_sources/test_ds.dart';
import 'package:flutter_clean_architecture/features/test/domain/repositories/test_repository.dart';

@LazySingleton(as: TestRepository)
class TestRepositoryImpl extends TestRepository {
  final TestDS testDS;

  TestRepositoryImpl(this.testDS);
}
