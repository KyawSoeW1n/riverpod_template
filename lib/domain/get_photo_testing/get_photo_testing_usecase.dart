import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GetPhotoTestUseCase {
  Future<AsyncValue<List<String>>> getPhotoTestingList();
}
