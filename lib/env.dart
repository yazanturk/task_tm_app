import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'keys.env')
abstract class Env {
  @EnviedField(varName: 'appId', obfuscate: true)
  static String appId = _Env.appId;
}
