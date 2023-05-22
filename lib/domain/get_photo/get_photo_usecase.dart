import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class GetPhotoUseCase {
  Future<List<String>> getPhotoList();
}
