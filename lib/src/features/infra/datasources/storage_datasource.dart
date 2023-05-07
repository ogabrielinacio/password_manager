abstract class IDataStorageService {
  Future<dynamic> readItem(dynamic key);
  Future<dynamic> writeItem(dynamic device);
  Future<dynamic> updateItem(dynamic key, dynamic device);
  Future<dynamic> deleteItem(dynamic key);
  Future<dynamic> readAllItens();
  Future<dynamic> searchItem(String value);
}
