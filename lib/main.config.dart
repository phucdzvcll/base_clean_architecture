// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/core.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/interceptors/main_network_interceptor.dart' as _i3;
import 'app/network_config/main_networ_config.dart' as _i5;
import 'features/test/data/data_sources/test_ds.dart' as _i7;
import 'features/test/data/repositories/test_repository_impl.dart' as _i9;
import 'features/test/domain/repositories/test_repository.dart' as _i8;
import 'features/test/domain/use_cases/test_use_case.dart' as _i10;
import 'features/test/presentation/test_screen/bloc/test_bloc.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.MainNetworkInterceptor>(
        () => _i3.MainNetworkInterceptor());
    gh.factory<_i4.TestCubit>(() => _i4.TestCubit());
    gh.lazySingleton<_i5.MainNetWorkConfig>(() => _i5.MainNetWorkConfig(
          gh<_i6.BuildMode>(),
          mainNetworkInterceptor: gh<_i3.MainNetworkInterceptor>(),
        ));
    gh.factory<_i7.TestDS>(() => _i7.TestDS(gh<_i5.MainNetWorkConfig>()));
    gh.lazySingleton<_i8.TestRepository>(
        () => _i9.TestRepositoryImpl(gh<_i7.TestDS>()));
    gh.factory<_i10.TestUseCase>(
        () => _i10.TestUseCase(testRepository: gh<_i8.TestRepository>()));
    return this;
  }
}
