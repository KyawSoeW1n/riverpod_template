import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/app_database.dart';

final favouritePostsStreamProvider = StreamProvider.autoDispose((ref) async* {
  final stream = ref.watch(databaseService).getFavouriteStream();
  yield* stream;
});