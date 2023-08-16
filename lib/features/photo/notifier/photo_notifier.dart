import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/extension/refresh_controller_extension.dart';

import '../../../core/state.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';

final photoNotifierProvider =
    StateNotifierProvider<PhotoNotifier, State<List<String>>>((ref) {
  return PhotoNotifier(
    ref.watch(getPhotoUseCaseImpl),
  );
});

class PhotoNotifier extends StateNotifier<State<List<String>>> {
  final GetPhotoUseCaseImpl _getPhotoUseCaseImpl;

  PhotoNotifier(
    this._getPhotoUseCaseImpl,
  ) : super(const State.loading()) {
    getPhotoList();
  }

  Future<void> getPhotoList(
      {RefreshController? refreshController, forceRefresh = false}) async {
    if(forceRefresh){
      state.data?.clear();
    }
    if (state.data == null) {
      state = const State.loading();
    }
    final photoList = await _getPhotoUseCaseImpl.getPhotoList();
    if (photoList != null) {
      if (state.data != null) {
        state.data!.addAll(photoList);

        // state = State.success(data);
        state = State.success(state.data!);
      } else {
        state = State.success(photoList);
      }
    }
    refreshController?.resetRefreshController();
  }
}
