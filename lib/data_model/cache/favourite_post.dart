import 'package:hive/hive.dart';

part 'favourite_post.g.dart';

@HiveType(typeId: 1)
class FavouritePost {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  FavouritePost(
    this.id,
    this.title,
  );
}
