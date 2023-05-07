import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'STORAGE_KEY', obfuscate: true)
  static final storageKey = _Env.storageKey;
}
