import 'package:flutter_test/flutter_test.dart';

import 'package:hive/hive.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final key = Hive.generateSecureKey();
    print(key);
  });
}
