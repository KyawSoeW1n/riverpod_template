import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/domain/add_favourite_post/add_favourite_post_usecase_impl.dart';

import '../../../data_model/vo/post_vo.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';
import '../../../domain/get_photo_testing/get_photo_testing_usecase_impl.dart';
import '../../../domain/get_posts/get_posts_usecase_impl.dart';

class PostNotifier extends StateNotifier<AsyncValue<List<PostVO>>> {
  final GetPostsUseCaseImpl _getPostsUseCaseImpl;
  final AddFavouritePostUseCaseImpl _addFavouritePostUseCaseImpl;
  final GetPhotoTestUseCaseImpl _getPhotoTestUseCaseImpl;

  PostNotifier(
    this._getPostsUseCaseImpl,
    this._addFavouritePostUseCaseImpl,
    this._getPhotoTestUseCaseImpl,
  ) : super(const AsyncLoading()) {
    getPostList();
  }

  void addFavouritePost(int id, String title) {
    _addFavouritePostUseCaseImpl.addFavouritePost(id, title);
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

class PhotoTestingNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetPhotoTestUseCaseImpl _getPhotoTestUseCaseImpl;

  PhotoTestingNotifier(
    this._getPhotoTestUseCaseImpl,
  ) : super(const AsyncLoading());

  void getPhotoList(BuildContext context) async {
    state = const AsyncLoading();
    state = await _getPhotoTestUseCaseImpl.getPhotoList();
    if (state is AsyncError) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Network Error'),
          content: Text('An error occurred during the network call.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
