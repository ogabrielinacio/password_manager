import 'package:hive/hive.dart';

part 'entry.g.dart';

@HiveType(typeId: 0)
class Entry extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String? url;

  Entry({
    required this.title,
    required this.username,
    required this.password,
    this.url,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['username'] = username;
    data['password'] = password;
    data['url'] = url;
    return data;
  }
}
