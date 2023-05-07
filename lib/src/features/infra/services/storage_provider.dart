import 'package:dartz/dartz.dart';
import 'package:password_manager/src/features/infra/datasources/storage_datasource.dart';
import 'package:password_manager/src/features/infra/handler/storage_handle.dart';
import 'package:password_manager/src/features/infra/handler/storage_response_status.dart';

class StorageProvider {
  final IDataStorageService service;

  StorageProvider(this.service);
  var handler = StorageHandler();

  Future<Either<StorageResponseStatus, dynamic>> readFromStorageService(
      dynamic key) async {
    var response = await service.readItem(key);
    return handler.handle(response);
  }

  Future<Either<StorageResponseStatus, dynamic>> writeToStorageService(
      dynamic device) async {
    var response = await service.writeItem(device);
    return handler.handle(response);
  }

  Future<Either<StorageResponseStatus, dynamic>> putToStorageService(
      dynamic key, dynamic device) async {
    var response = await service.updateItem(key, device);
    return handler.handle(response);
  }

  Future<Either<StorageResponseStatus, dynamic>> deleteFromStorageService(
      dynamic key) async {
    var response = await service.deleteItem(key);
    return handler.handle(response);
  }

  Future<Either<StorageResponseStatus, dynamic>>
      readAllFromStorageService() async {
    var response = await service.readAllItens();
    return handler.handle(response);
  }

  Future<Either<StorageResponseStatus, dynamic>> searchFromStorageService(
      String value) async {
    var response = await service.searchItem(value);
    return handler.handle(response);
  }
}
