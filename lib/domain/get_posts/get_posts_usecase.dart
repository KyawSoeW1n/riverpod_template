import '../../data_model/vo/post_vo.dart';

abstract class GetPostsUseCase {
  Future<List<PostVO>> getPostList();
}
