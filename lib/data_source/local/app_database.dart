import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final databaseService = Provider<DatabaseService>((_) => DatabaseService());

class DatabaseService {
  late final Box<String> themeBox;

  String get savedTheme => themeBox.values.first;

  Future<void> initTheme() async {
    await Hive.openBox<String>('theme').then((value) => themeBox = value);

    //first time loading
    if (themeBox.values.isEmpty) {
      themeBox.add('light');
    }
  }

  Future<void> toggleSaveTheme(String mode) async =>
      await themeBox.put(0, mode);
}
