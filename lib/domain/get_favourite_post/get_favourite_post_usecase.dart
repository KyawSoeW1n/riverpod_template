import 'package:riverpod_testing/data_model/cache/favourite_post.dart';

abstract class GetFavouritePostUseCase {
  Stream<List<FavouritePost>> getFavouritePostsList();
}
