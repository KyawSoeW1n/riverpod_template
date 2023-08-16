import '../../../data_model/vo/post_vo.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostVO>> getPostList();
}
