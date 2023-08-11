import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_model/vo/post_vo.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostVO>> getPostList();

  Future<List<String>> getPhotoList();

  Future<AsyncValue<List<String>>> getPhotoTestingList();
}
