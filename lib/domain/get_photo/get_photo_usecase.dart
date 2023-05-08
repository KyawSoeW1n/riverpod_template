import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GetPhotoUseCase {
  Future<AsyncValue<List<String>>> getPhotoList();
}
