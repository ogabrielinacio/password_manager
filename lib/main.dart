import 'package:flutter/widgets.dart';

import 'package:password_manager/src/components/app_widget.dart';
import 'package:password_manager/configs/hive/hive_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  runApp(const AppWidget());
}


//TODO: Store what the user inputs as a password, 
//and when logging in, compare these hashes