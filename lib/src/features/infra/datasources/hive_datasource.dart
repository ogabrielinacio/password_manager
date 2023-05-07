import 'package:flutter/widgets.dart';

import 'package:hive/hive.dart';
import 'package:password_manager/src/features/infra/datasources/storage_datasource.dart';
import 'package:password_manager/src/features/infra/handler/storage_response_status.dart';

class HiveService implements IDataStorageService {
  final String boxName;
  final String? hiveKey;
  final int? limit;
  late List<String> stringKey = [];
  late List<int> key;
  late Box box;

  HiveService(this.boxName, [this.hiveKey, this.limit]) {
    if (hiveKey != null) {
      stringKey = hiveKey!.split(',');
    }
    initBox();
  }

  Future initBox() async {
    (hiveKey != null)
        ? key = stringKey.map((e) => int.parse(e)).toList()
        : key = [];
    try {
      if (key.isNotEmpty) {
        box = await Hive.openBox(boxName, encryptionCipher: HiveAesCipher(key));
      } else {
        box = await Hive.openBox(boxName);
      }
      return StorageResponseStatus.dBCreated;
    } catch (e) {
      debugPrint("Error opening box: $e");
      return StorageResponseStatus.failedDBCreated;
    }
  }

  @override
  Future readItem(dynamic key) async {
    try {
      var response = await box.get(key);
      if (response == null) {
        return StorageResponseStatus.notFound;
      } else {
        return response;
      }
    } catch (e) {
      debugPrint("Error reading box: $e");
      return StorageResponseStatus.errorReading;
    }
  }

  @override
  Future writeItem(dynamic device) async {
    Map<String, dynamic> jsonDevice = device.toJson();
    if (box.containsKey(jsonDevice[jsonDevice.keys.first])) {
      return StorageResponseStatus.alreadyRegistered;
    } else {
      try {
        if (limit != null) {
          if (box.length <= limit!) {
            await box.put(jsonDevice[jsonDevice.keys.first], device);
            return StorageResponseStatus.itemCreated;
          } else {
            return StorageResponseStatus.limitReached;
          }
        } else {
          await box.put(jsonDevice[jsonDevice.keys.first], device);
          return StorageResponseStatus.itemCreated;
        }
      } catch (e) {
        debugPrint("Error writing box: $e");
        return StorageResponseStatus.errorWriting;
      }
    }
  }

  @override
  Future updateItem(dynamic key, dynamic device) async {
    try {
      await box.putAt(key, device);
      return StorageResponseStatus.itemUpdated;
    } catch (e) {
      debugPrint("Error updating box: $e");
      return StorageResponseStatus.errorUpdating;
    }
  }

  @override
  Future deleteItem(dynamic key) async {
    try {
      await box.deleteAt(key);
      return StorageResponseStatus.itemDeleted;
    } catch (e) {
      debugPrint("Error deleting item of box: $e");
      return StorageResponseStatus.errorDeleting;
    }
  }

  @override
  Future<dynamic> searchItem(String value) async {

    var itemExists = box.values.where(((element) {
      if (element.toJson()[element.toJson().keys.first] == value ||
          element.toJson()[element.toJson().keys.last].toLowerCase() ==
              value.toLowerCase()) {
        return true;
      }
      return false;
    }));
    // if (itemExists.contains(true)) {
    if (itemExists.isNotEmpty) {
      return itemExists.toList();
    } else {
      return StorageResponseStatus.notFound;
    }
  }

  @override
  Future readAllItens() async {
    try {
      var valuesList = box.values.toList();
      if (valuesList.isEmpty) {
        return StorageResponseStatus.emptyList;
      } else {
        return valuesList;
      }
    } catch (e) {
      debugPrint("Error reading all box: $e");
      return StorageResponseStatus.errorReadingAll;
    }
  }
}
