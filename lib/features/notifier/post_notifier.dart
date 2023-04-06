import 'package:riverpod/riverpod.dart';
import 'package:riverpod_testing/features/service/post_service.dart';

class PostNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final PostService _service;

  PostNotifier(this._service) : super(const AsyncLoading()) {
    getPosts();
  }

  void getPosts() async {
    state = const AsyncLoading();
    state = await _service.getPostList();
  }
}
