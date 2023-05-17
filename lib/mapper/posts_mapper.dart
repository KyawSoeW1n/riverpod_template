import 'package:riverpod_testing/data_model/cache/favourite_post.dart';

import 'base/base_database_mapper.dart';

class PostMapper
    implements BaseDatabaseMapper<List<FavouritePost>, List<FavouritePost>> {
  @override
  List<FavouritePost> mapFromDatabase(List<FavouritePost> data) {
    return data.map((e) => FavouritePost(e.id, e.title)).toList();
  }

  @override
  List<FavouritePost> mapToEntity(List<FavouritePost> data) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }
}
