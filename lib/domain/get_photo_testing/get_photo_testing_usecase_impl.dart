import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_source/network/posts/post_remote_datasource_impl.dart';
import 'get_photo_testing_usecase.dart';

class GetPhotoTestUseCaseImpl extends GetPhotoTestUseCase {
  final PostRemoteDataSourceImpl _postRemoteDataSourceImpl;

  GetPhotoTestUseCaseImpl(this._postRemoteDataSourceImpl);

  @override
  Future<AsyncValue<List<String>>> getPhotoTestingList() async {
    try {
      // return await _postRemoteDataSourceImpl.getPostList();
      return AsyncValue.data([]);
    } catch (e) {
      return AsyncError(e, StackTrace.current);
    }
  }
}
