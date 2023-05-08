import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GetPostsUseCase {
  Future<AsyncValue<List<String>>> getPostList();
}
