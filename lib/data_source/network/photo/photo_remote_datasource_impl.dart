import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/app_constants/api_routes.dart';
import 'package:riverpod_testing/data_source/network/photo/photo_remote_datasource.dart';
import 'package:riverpod_testing/mapper/photo_mapper.dart';

import '../../../app_constants/app_constants.dart';
import '../../../core/network/base_remote_datasource.dart';

final photoRemoteDataSourceImpl =
    FutureProvider.autoDispose<PhotoRemoteDataSourceImpl>(
        (ref) => PhotoRemoteDataSourceImpl(ref.watch(photoMapper)));

class PhotoRemoteDataSourceImpl extends BaseRemoteSource
    implements PhotoRemoteDataSource {
  final PhotoMapper _photoMapper;

  PhotoRemoteDataSourceImpl(
    this._photoMapper,
  );

  @override
  Future<List<String>> getPhotoList(int pageNo) async {
    try {
      final endpoint = "${AppConstants.baseUrl}${ApiRoutes.getPhoto}";
      return callApiWithErrorParser(() => dioClient.get(endpoint)).then(
        (response) {
          return _photoMapper.mapFromResponse(response.data);
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
