import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_source/network/posts/post_remote_datasource_impl.dart';
import 'get_photo_usecase.dart';

class GetPhotoUseCaseImpl extends GetPhotoUseCase {
  final PostRemoteDataSourceImpl _postRemoteDataSourceImpl;

  GetPhotoUseCaseImpl(this._postRemoteDataSourceImpl);

  @override
  Future<AsyncValue<List<String>>> getPhotoList() async {
    return await _postRemoteDataSourceImpl.getPhotoList();
  }
}
