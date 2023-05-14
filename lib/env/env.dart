import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'STORAGE_KEY1', obfuscate: true)
  static final storageKey1 = _Env.storageKey1;
  @EnviedField(varName: 'STORAGE_KEY2', obfuscate: true)
  static final storageKey2 = _Env.storageKey2;
}
