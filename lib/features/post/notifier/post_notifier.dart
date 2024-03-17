import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/network/exception/base_exception.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:riverpod_testing/domain/fetch_posts/fetch_posts_usecase_impl.dart';

import '../../../core/state.dart';
import '../../../domain/change_post_status/change_post_status_usecase.dart';
import '../../../domain/fetch_posts/fetch_posts_usecase.dart';
import '../../../domain/model/post_vo.dart';
import '../../../domain/change_post_status/change_post_status_usecase_impl.dart';

final postNotifierProvider =
    StateNotifierProvider.autoDispose<PostNotifier, State<List<PostVO>>>((ref) {
  return PostNotifier(
    ref.read(fetchPostUseCaseImpl),
    ref.read(changePostStatusUseCaseImpl),
  );
});

class PostNotifier extends StateNotifier<State<List<PostVO>>> {
  final FetchPostsUseCase _getPostsUseCase;
  final ChangePostStatusUseCase _changePostStatusUseCase;

  PostNotifier(
    this._getPostsUseCase,
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
      await _getPostsUseCase.fetchPostList();
      state = const State.success(null);
    } on BaseException catch (e) {
      state = State.error(e);
    }
  }
}
