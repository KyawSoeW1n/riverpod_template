import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/app_constants/app_route_configuration.dart';
import 'package:riverpod_testing/core/exception_handler/exception_handler.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/core/network/exception/not_found_exception.dart';
import 'package:riverpod_testing/domain/add_favourite_post/add_favourite_post_usecase_impl.dart';
import 'package:riverpod_testing/features/post/provider/post_provider.dart';

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

class PhotoNotifier extends StateNotifier<AsyncValue> {
  final GetPhotoUseCaseImpl _getPhotoUseCaseImpl;
  final BuildContext context;
  final int itemsPerPage = 10;

  int currentPage = 1;
  List<String> allPhotos = [];
  List<String> get allFetchedPhotos => allPhotos;

  PhotoNotifier(
    this._getPhotoUseCaseImpl,
    this.context,
  ) : super(const AsyncLoading()) {
    getPhotoList();
  }

  void getPhotoList() async {
    if (allPhotos.isEmpty) state = const AsyncLoading();
    try {
      final result = await _getPhotoUseCaseImpl.getPhotoList();
      allPhotos.addAll(result);
      currentPage++;
      state = AsyncValue.data(allPhotos);
    } catch (e, s) {
      if (allPhotos.isEmpty) {
        state = AsyncValue.error(e, s);
      } else {
        e.handleSpecificException(
          onNetworkException: (_) => showErrorDialog(_ ?? "", context),
          onNotFoundException: (_) => showErrorDialog(_ ?? "", context),
          onCommonException: (_) => showErrorDialog(_ ?? "", context),
        );
      }
    }
  }
}

class PhotoTestingNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetPhotoTestUseCaseImpl _getPhotoTestUseCaseImpl;

  PhotoTestingNotifier(
    this._getPhotoTestUseCaseImpl,
  ) : super(const AsyncLoading());

  void getPhotoList(BuildContext context) async {
    state = const AsyncLoading();
    state = await _getPhotoTestUseCaseImpl.getPhotoTestingList();
    // state.handleSpecificException(
    //   onNetworkException: (_) => showErrorDialog(_, context),
    //   // onNotFoundException: (_)=> debugPrint("Not Found For this API"),
    //   onCommonException: (_) => showErrorDialog(_, context),
    // );
  }
}

showErrorDialog(String? msg, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("$msg"),
      content: Text("${msg}"),
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
