import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/domain/get_photo/get_photo_usecase_impl.dart';
import 'package:riverpod_testing/domain/get_posts/get_posts_usecase_impl.dart';

import '../../../data_source/network/posts/post_remote_datasource_impl.dart';
import '../notifier/post_notifier.dart';

final postRemoteDataSourceImpl =
    Provider<PostRemoteDataSourceImpl>((ref) => PostRemoteDataSourceImpl());

final getPostUseCaseImpl = Provider<GetPostsUseCaseImpl>(
    (ref) => GetPostsUseCaseImpl(ref.read(postRemoteDataSourceImpl)));

final getPhotoUseCaseImpl = Provider<GetPhotoUseCaseImpl>(
    (ref) => GetPhotoUseCaseImpl(ref.read(postRemoteDataSourceImpl)));

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, AsyncValue<List<String>>>((ref) {
  return PostNotifier(ref.read(getPostUseCaseImpl));
});

final photoNotifierProvider =
    StateNotifierProvider<PhotoNotifier, AsyncValue<List<String>>>((ref) {
  return PhotoNotifier(ref.read(getPhotoUseCaseImpl));
});
