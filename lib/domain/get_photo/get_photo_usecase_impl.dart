import 'package:riverpod_testing/data_source/network/photo/photo_remote_datasource_impl.dart';

import 'get_photo_usecase.dart';

class GetPhotoUseCaseImpl extends GetPhotoUseCase {
  final PhotoRemoteDataSourceImpl _photoRemoteDataSourceImpl;

  GetPhotoUseCaseImpl(this._photoRemoteDataSourceImpl);

  @override
  Future<List<String>> getPhotoList() async {
    try {
      return await _photoRemoteDataSourceImpl.getPhotoList();
    } catch (e) {
      rethrow;
    }
  }
}
