import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'add_favourite_post_usecase.dart';

final addFavouritePostUseCaseImpl = Provider<AddFavouritePostUseCaseImpl>(
    (ref) => AddFavouritePostUseCaseImpl(ref.read(postLocalDataSourceImpl)));

class AddFavouritePostUseCaseImpl extends AddFavouritePostUseCase {
  final FavouritePostLocalDataSourceImpl _favouritePostLocalDataSourceImpl;

  AddFavouritePostUseCaseImpl(this._favouritePostLocalDataSourceImpl);

  @override
  Future<void> addFavouritePost(int id, String title) async {
    return await _favouritePostLocalDataSourceImpl.addFavouritePost(id, title);
  }
}
