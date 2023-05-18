import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/core/exception_handler/exception_handler.dart';
import 'package:riverpod_testing/domain/add_favourite_post/add_favourite_post_usecase_impl.dart';

import '../../../data_model/vo/post_vo.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';
import '../../../domain/get_photo_testing/get_photo_testing_usecase_impl.dart';
import '../../../domain/get_posts/get_posts_usecase_impl.dart';

class PostNotifier extends StateNotifier<AsyncValue<List<PostVO>>> {
  final GetPostsUseCaseImpl _getPostsUseCaseImpl;
  final AddFavouritePostUseCaseImpl _addFavouritePostUseCaseImpl;

  PostNotifier(
    this._getPostsUseCaseImpl,
    this._addFavouritePostUseCaseImpl,
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
    debugPrint("GGWP >>>>>>> ${state.hasValue}");
    debugPrint("GGWP >>>>>>> ${state.value}");
    debugPrint("GGWP >>>>>>> ${state.hasError}");
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
    state = await _getPhotoTestUseCaseImpl.getPhotoTestingList();
    state.handleSpecificException(
      onNetworkException: (_) => showErrorDialog(_, context),
      onNotFoundException: (_) => Fluttertoast.showToast(
          msg: "This is Center Short Toast",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0),
      // onNotFoundException: (_)=> debugPrint("Not Found For this API"),
      onCommonException: (_) => showErrorDialog(_, context),
    );
  }
}

showErrorDialog(String? msg, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("$msg"),
      content: Text("$msg"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
