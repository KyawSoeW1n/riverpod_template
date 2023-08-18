import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/domain/get_posts/get_posts_usecase_impl.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../core/state.dart';
import '../../../data_model/vo/post_vo.dart';
import '../../../domain/add_favourite_post/add_favourite_post_usecase_impl.dart';
import '../notifier/post_notifier.dart';

final postMapper = Provider<PostMapper>((ref) => PostMapper());

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, State<List<PostVO>>>((ref) {
  return PostNotifier(
    ref.read(getPostUseCaseImpl),
    ref.read(addFavouritePostUseCaseImpl),
  );
});
