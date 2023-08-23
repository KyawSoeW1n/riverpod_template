import 'package:hive/hive.dart';

part 'cache_post.g.dart';

@HiveType(typeId: 1)
class CachePost extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;
  @HiveField(2)
  bool isFavourite;

  CachePost(
    this.id,
    this.title,
    this.isFavourite,
  );
}
