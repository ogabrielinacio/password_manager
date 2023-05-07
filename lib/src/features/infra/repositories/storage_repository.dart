
import 'package:password_manager/src/features/infra/datasources/hive_datasource.dart';
import 'package:password_manager/src/features/infra/services/storage_provider.dart';

class StorageRepository {
  final String dbName;
  final String? dbkey;
  final int? dbLimit;
  late final HiveService hiveService;
  late final StorageProvider storageProvider;

  StorageRepository({required this.dbName, this.dbkey, this.dbLimit}) {
    hiveService = HiveService(dbName, dbkey, dbLimit);
    storageProvider = StorageProvider(hiveService);
  }

  Future<dynamic> readFromStorage(dynamic key) async {
    var response = await storageProvider.readFromStorageService(key);
    return response;
  }

  Future<dynamic> writeToStorage(dynamic device) async {
    var response = await storageProvider.writeToStorageService(device);
    return response;
  }

  Future<dynamic> putToStorage(dynamic key, dynamic device) async {
    var response = await storageProvider.putToStorageService(key, device);
    return response;
  }

  Future<dynamic> deleteFromStorage(dynamic key) async {
    var response = await storageProvider.deleteFromStorageService(key);
    return response;
  }

  Future<dynamic> readAllFromStorage() async {
    var response = await storageProvider.readAllFromStorageService();
    return response;
  }

  Future<dynamic> searchFromStorage(String value) async {
    var response = await storageProvider.searchFromStorageService(value);
    return response;
  }
}
