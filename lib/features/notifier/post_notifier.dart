import 'package:riverpod/riverpod.dart';

import '../../domain/get_photo/get_photo_usecase_impl.dart';
import '../../domain/get_posts/get_posts_usecase_impl.dart';

class PostNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetPostsUseCaseImpl _getPostsUseCaseImpl;

  PostNotifier(
    this._getPostsUseCaseImpl,
  ) : super(const AsyncLoading()) {
    getPostList();
  }

  void getPostList() async {
    state = const AsyncLoading();
    state = await _getPostsUseCaseImpl.getPostList();
  }
}

class PhotoNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetPhotoUseCaseImpl _getPhotoUseCaseImpl;

  PhotoNotifier(
    this._getPhotoUseCaseImpl,
  ) : super(const AsyncLoading()) {
    getPhotoList();
  }

  void getPhotoList() async {
    state = const AsyncLoading();
    state = await _getPhotoUseCaseImpl.getPhotoList();
  }
}
