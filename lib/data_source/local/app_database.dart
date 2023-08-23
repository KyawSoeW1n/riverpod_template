import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_testing/app_constants/db_constants.dart';
import 'package:riverpod_testing/core/enum_collection/theme_type.dart';
import 'package:riverpod_testing/core/locale/support_locale.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:rxdart/rxdart.dart';

final databaseService = Provider<DatabaseService>((_) => DatabaseService());

final postsStreamProvider = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getPostStream();
});

final favouritePostsStreamProvider = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getFavouritePostStream();
});

final favouritePostListStream = StreamProvider.autoDispose((ref) async* {
  yield* ref.watch(databaseService).getFavouritePostListStream();
});

class DatabaseService {
  late final Box<String> _themeBox;
  late final Box<CachePost> _postBox;
  late final Box<String> _languageBox;
  late final Box<String> _userDataBox;

  String get savedTheme => _themeBox.values.first;

  Future<void> initTheme() async {
    await Hive.openBox<String>(DBConstants.themeBox)
        .then((value) => _themeBox = value);

    if (_themeBox.values.isEmpty) {
      _themeBox.add(ThemeType.light.name);
    }
  }

  Future<void> initUserDataBox() async {
    await Hive.openBox<String>(DBConstants.userDataBox)
        .then((value) => _userDataBox = value);

    if (_userDataBox.values.isEmpty) {
      _userDataBox.add("");
    }
  }

  Future<void> initLanguageBox() async {
    await Hive.openBox<String>(DBConstants.languageBox)
        .then((value) => _languageBox = value);

    if (_languageBox.values.isEmpty) {
      _languageBox.add(
        SupportedLocale.en.languageCode,
      );
    }
  }

  Future<void> initPostBox() async {
    await Hive.openBox<CachePost>(DBConstants.postBox)
        .then((value) => _postBox = value);
  }

  Future<void> toggleSaveTheme(String mode) async =>
      await _themeBox.put(0, mode);

  Future<void> saveLanguage(SupportedLocale locale) async =>
      await _languageBox.put(0, locale.languageCode);

  Future<void> saveUserDataBox(String userData) async =>
      await _userDataBox.put(0, userData);

  String getUserBox() => _userDataBox.getAt(0) ?? "";

  Future<void> changePostStatus(CachePost cachePost) async {
    cachePost.isFavourite = !cachePost.isFavourite;
    cachePost.save();
  }

  Future<void> insertPostList(List<CachePost> postList) async {
    for (var newData in postList) {
      // Check if the data already exists in the box
      int existingIndex = _postBox.values
          .cast<CachePost>()
          .toList()
          .indexWhere((item) => item.id == newData.id);

      if (existingIndex != -1) {
        // Update existing data
        _postBox.putAt(existingIndex, newData);
      } else {
        // Add new data
        _postBox.add(newData);
      }
    }
  }

  Stream<List<CachePost>> getPostStream() {
    return _postBox
        .watch()
        .map((event) => getPostList())
        .startWith(getPostList());
  }

  Stream<int> getFavouritePostStream() {
    return _postBox
        .watch()
        .map((event) => getFavouritePostCount())
        .startWith(getFavouritePostCount());
  }

  Stream<List<CachePost>> getFavouritePostListStream() {
    return _postBox
        .watch()
        .map((event) => getFavouritePostList())
        .startWith(getFavouritePostList());
  }

  List<CachePost> getPostList() {
    return List<CachePost>.from(_postBox.values);
  }

  Locale getLanguage() {
    return Locale(_languageBox.getAt(0) ?? SupportedLocale.en.languageCode);
  }

  List<CachePost> getFavouritePostList() {
    final favouriteList = List<CachePost>.from(_postBox.values)
        .where((element) => element.isFavourite)
        .toList();
    return favouriteList;
  }

  int getFavouritePostCount() {
    final favouritePostList = List<CachePost>.from(_postBox.values)
        .where((element) => element.isFavourite)
        .toList();
    return favouritePostList.length;
  }
}
