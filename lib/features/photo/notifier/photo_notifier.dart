import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/state.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';

class PhotoNotifier extends StateNotifier<State<List<String>>> {
  final GetPhotoUseCaseImpl _getPhotoUseCaseImpl;

  PhotoNotifier(
    this._getPhotoUseCaseImpl,
  ) : super(const State.loading()) {
    getPhotoList();
  }

  Future<void> getPhotoList() async {
    state = const State.loading();
    final photoList = await _getPhotoUseCaseImpl.getPhotoList();
    state = State.success(photoList);
  }
}
