import 'dart:io';

import 'package:flutter/widgets.dart';


import 'package:hive_flutter/hive_flutter.dart';
import 'package:password_manager/src/features/infra/adapters/entry.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    try {
      await Hive.initFlutter(dir.path);
    } catch (e) {
      debugPrint("Error initing Hive: $e");
    }
    try {
      Hive.registerAdapter(EntryAdapter());
    } catch (e) {
      debugPrint("Error registering adapter: $e");
    }
  }
}
