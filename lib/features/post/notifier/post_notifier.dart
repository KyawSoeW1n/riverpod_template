import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/core/utils/app_utils.dart';
import 'package:riverpod_testing/data_model/cache/favourite_post.dart';
import 'package:riverpod_testing/domain/change_post_status/change_post_status_usecase.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/post_vo.dart';
import '../../../domain/change_post_status/change_post_status_usecase_impl.dart';
import '../../../domain/get_posts/get_posts_usecase_impl.dart';

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, State<List<PostVO>>>((ref) {
  return PostNotifier(
    ref.read(getPostUseCaseImpl),
    ref.read(changePostStatusUseCaseImpl),
  );
});

class PostNotifier extends StateNotifier<State<List<PostVO>>> {
  final GetPostsUseCaseImpl _getPostsUseCaseImpl;
  final ChangePostStatusUseCase _changePostStatusUseCase;

  PostNotifier(
    this._getPostsUseCaseImpl,
    this._changePostStatusUseCase,
  ) : super(const State.init()) {
    getPostList();
  }

  void changePostStatus(CachePost cachePost) {
    _changePostStatusUseCase.changePostStatus(cachePost);
  }

  void getPostList() async {
    try {
      state = const State.loading();
      await _getPostsUseCaseImpl.getPostList();
      state = const State.success(null);
    } on BaseException catch (e) {
      AppUtils.showToast(e.message);
    }
  }
}
