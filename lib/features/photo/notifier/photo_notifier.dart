import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/core/utils/app_utils.dart';
import 'package:riverpod_testing/extension/refresh_controller_extension.dart';

import '../../../core/state.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';

final photoNotifierProvider =
    StateNotifierProvider.autoDispose<PhotoNotifier, State<List<String>>>(
        (ref) {
  return PhotoNotifier(
    ref.watch(getPhotoUseCaseImpl),
  );
});

class PhotoNotifier extends StateNotifier<State<List<String>>> {
  final GetPhotoUseCaseImpl _getPhotoUseCaseImpl;
  int pageNo = 1;

  PhotoNotifier(
    this._getPhotoUseCaseImpl,
  ) : super(const State.loading()) {
    getPhotoList();
  }

  Future<void> getPhotoList(
      {RefreshController? refreshController, forceRefresh = false}) async {
    if (forceRefresh) {
      state.data?.clear();
    }

    try {
      final photoList = await _getPhotoUseCaseImpl.getPhotoList(pageNo);
      if (photoList != null) {
        pageNo++;
        if (state.data != null) {
          state.data!.addAll(photoList);
          state = State.success(state.data!);
        } else {
          state = State.success(photoList);
        }
      }
      refreshController?.resetRefreshController();
    } on BaseException catch (e) {
      if (state.data != null && state.data!.isEmpty) {
        state = State.error(Exception("GG"));
      } else {
        AppUtils.showToast(e.message);
      }
      refreshController?.resetRefreshController();
    }
  }
}
