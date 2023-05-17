import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_model/vo/post_vo.dart';

abstract class PostsRemoteDataSource {
  Future<AsyncValue<List<PostVO>>> getPostList();

  Future<AsyncValue<List<String>>> getPhotoList();
}
