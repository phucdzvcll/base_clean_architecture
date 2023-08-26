import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/network_config/main_networ_config.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'test_ds.g.dart';

@Injectable()
@RestApi()
abstract class TestDS {
  @factoryMethod
  factory TestDS(MainNetWorkConfig mainNetWorkConfig) => _TestDS(mainNetWorkConfig.dio);

}
