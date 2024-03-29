import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';

import '../../../core/state.dart';
import '../../../domain/model/post_vo.dart';
import '../../../domain/change_post_status/change_post_status_usecase_impl.dart';

final favouritePostNotifierProvider =
    StateNotifierProvider<FavouritePostNotifier, State<List<PostVO>>>((ref) {
  return FavouritePostNotifier(
    ref.read(changePostStatusUseCaseImpl),
  );
});

class FavouritePostNotifier extends StateNotifier<State<List<PostVO>>> {
  final ChangePostStatusUseCaseImpl _changePostStatusUseCaseImpl;

  FavouritePostNotifier(
    this._changePostStatusUseCaseImpl,
  ) : super(const State.init());

  void changePostStatus(CachePost cachePost) {
    _changePostStatusUseCaseImpl.changePostStatus(cachePost);
  }
}
