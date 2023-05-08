import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class PostsRemoteDataSource {
  Future<AsyncValue<List<String>>> getPostList();

  Future<AsyncValue<List<String>>> getPhotoList();
}
