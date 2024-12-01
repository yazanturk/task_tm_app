import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:task_tm_app/config/helper/hive_helper/hive_database.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async => getIt.init();

@module
abstract class RegisterModule {
  @lazySingleton
  HiveCacheHelper get hiveCacheHelper => HiveCacheHelper();
}
