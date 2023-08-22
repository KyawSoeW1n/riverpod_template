import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/network/photo/photo_remote_datasource_impl.dart';

import 'get_photo_usecase.dart';

final getPhotoUseCaseImpl = Provider.autoDispose<GetPhotoUseCaseImpl>(
    (ref) => GetPhotoUseCaseImpl(ref.watch(photoRemoteDataSourceImpl)));

class GetPhotoUseCaseImpl extends GetPhotoUseCase {
  final AsyncValue<PhotoRemoteDataSourceImpl> _photoRemoteDataSourceImpl;

  GetPhotoUseCaseImpl(this._photoRemoteDataSourceImpl);

  @override
  Future<List<String>?> getPhotoList(int pageNo) async {
    try {
      return await _photoRemoteDataSourceImpl.value?.getPhotoList(pageNo);
    } catch (e) {
      rethrow;
    }
  }
}
