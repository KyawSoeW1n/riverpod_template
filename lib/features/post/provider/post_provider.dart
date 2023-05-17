import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/app_database.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'package:riverpod_testing/domain/get_photo/get_photo_usecase_impl.dart';
import 'package:riverpod_testing/domain/get_posts/get_posts_usecase_impl.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../data_source/network/posts/post_remote_datasource_impl.dart';
import '../../../domain/add_favourite_post/add_favourite_post_usecase_impl.dart';
import '../../../domain/get_favourite_post/get_favourite_post_usecase_impl.dart';
import '../../../mapper/photo_mapper.dart';
import '../notifier/post_notifier.dart';

final photoMapper = Provider<PhotoMapper>((ref) => PhotoMapper());
final postMapper = Provider<PostMapper>((ref) => PostMapper());

final postLocalDataSourceImpl = Provider<FavouritePostLocalDataSourceImpl>(
    (ref) => FavouritePostLocalDataSourceImpl(
        ref.read(postMapper), ref.read(databaseService)));

final postRemoteDataSourceImpl = Provider<PostRemoteDataSourceImpl>(
    (ref) => PostRemoteDataSourceImpl(ref.read(photoMapper)));

final getPostUseCaseImpl = Provider<GetPostsUseCaseImpl>(
    (ref) => GetPostsUseCaseImpl(ref.read(postRemoteDataSourceImpl)));

final getPhotoUseCaseImpl = Provider<GetPhotoUseCaseImpl>(
    (ref) => GetPhotoUseCaseImpl(ref.read(postRemoteDataSourceImpl)));

final addFavouritePostUseCaseImpl = Provider<AddFavouritePostUseCaseImpl>(
    (ref) => AddFavouritePostUseCaseImpl(ref.read(postLocalDataSourceImpl)));

final getFavouritePostUseCaseImpl = Provider<GetFavouritePostUseCaseImpl>(
    (ref) => GetFavouritePostUseCaseImpl(ref.read(postLocalDataSourceImpl)));

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, AsyncValue<List<String>>>((ref) {
  return PostNotifier(
    ref.read(getPostUseCaseImpl),
    ref.read(addFavouritePostUseCaseImpl),
  );
});

final photoNotifierProvider =
    StateNotifierProvider<PhotoNotifier, AsyncValue<List<String>>>((ref) {
  return PhotoNotifier(ref.read(getPhotoUseCaseImpl));
});

final favouritePostsStreamProvider = StreamProvider.autoDispose((ref) async* {
  final stream = ref.watch(databaseService).getFavouriteStream();
  var count = 0;
  stream.listen((event) {
    count = event.length;
  });
  await for (final value in stream) {
    yield value;
  }
});
