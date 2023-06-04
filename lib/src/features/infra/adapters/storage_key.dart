import 'package:hive/hive.dart';

part 'storage_key.g.dart';

@HiveType(typeId: 0)
class StorageKey extends HiveObject {
  @HiveField(0)
  final String storageKey;

  StorageKey({
    required this.storageKey,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['storageKey'] = storageKey;
    return data;
  }

}
