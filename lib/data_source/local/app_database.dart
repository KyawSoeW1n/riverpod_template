import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_testing/data_model/cache/favourite_post.dart';
import 'package:rxdart/rxdart.dart';

final databaseService = Provider<DatabaseService>((_) => DatabaseService());

class DatabaseService {
  late final Box<String> themeBox;
  late final Box<FavouritePost> _favouritePostBox;

  String get savedTheme => themeBox.values.first;

  Future<void> initTheme() async {
    await Hive.openBox<String>('theme').then((value) => themeBox = value);

    //first time loading
    if (themeBox.values.isEmpty) {
      themeBox.add('light');
    }
  }

  Future<void> initFavouriteBox() async {
    await Hive.openBox<FavouritePost>('favourites')
        .then((value) => _favouritePostBox = value);
  }

  Future<void> toggleSaveTheme(String mode) async =>
      await themeBox.put(0, mode);

  Future<void> addFavouritePost(int id, String title) async {
    _favouritePostBox.put(id, FavouritePost(id, title));
  }

  Stream<List<FavouritePost>> getFavouriteStream() {
    return _favouritePostBox
        .watch()
        .map((event) => getFavouritePosts())
        .startWith(getFavouritePosts());
  }

  List<FavouritePost> getFavouritePosts() {
    return List<FavouritePost>.from(_favouritePostBox.values);
  }
}
