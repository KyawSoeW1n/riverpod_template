import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data_source/network/photo/photo_remote_datasource_impl.dart';
import '../../../domain/get_photo/get_photo_usecase_impl.dart';
import '../../../mapper/photo_mapper.dart';
import '../../post/notifier/post_notifier.dart';

final photoMapper = Provider<PhotoMapper>((ref) => PhotoMapper());

final photoRemoteDataSourceImpl = Provider<PhotoRemoteDataSourceImpl>(
    (ref) => PhotoRemoteDataSourceImpl(ref.read(photoMapper)));

final getPhotoUseCaseImpl = Provider<GetPhotoUseCaseImpl>(
    (ref) => GetPhotoUseCaseImpl(ref.read(photoRemoteDataSourceImpl)));

final photoNotifierProvider =
    StateNotifierProvider<PhotoNotifier, AsyncValue<List<String>>>((ref) {
  return PhotoNotifier(
    ref.read(getPhotoUseCaseImpl),
  );
});
