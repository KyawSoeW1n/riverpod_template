import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_model/cache/favourite_post.dart';
import 'package:riverpod_testing/data_source/local/app_database.dart';
import 'package:riverpod_testing/data_source/local/favourite_post/favourite_post_local_datasource_impl.dart';
import 'package:riverpod_testing/mapper/posts_mapper.dart';

import '../../../domain/get_favourite_post/get_favourite_post_usecase_impl.dart';

final postMapper = Provider<PostMapper>((ref) => PostMapper());

final postLocalDataSourceImpl = Provider<FavouritePostLocalDataSourceImpl>(
    (ref) => FavouritePostLocalDataSourceImpl(
        ref.read(postMapper), ref.read(databaseService)));

final getFavouritePostUseCaseImpl = Provider<GetFavouritePostUseCaseImpl>(
    (ref) => GetFavouritePostUseCaseImpl(ref.read(postLocalDataSourceImpl)));

// final favouritePostNotifierProvider = StateNotifierProvider<
//     FavouritePostNotifier, AsyncValue<List<FavouritePost>>>((ref) {
//   return FavouritePostNotifier(ref.read(getFavouritePostUseCaseImpl));
// });
