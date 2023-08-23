import 'package:flutter/material.dart';
import 'package:riverpod_testing/core/resource/app_dimens.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';

import '../../../widget/common/text_view_widget.dart';

class FavouritePostItemWidget extends StatelessWidget {
  final CachePost cachePost;
  final Function function;

  const FavouritePostItemWidget(
    this.cachePost,
    this.function, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.margin16,
        vertical: AppDimens.margin8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.margin8,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.margin16,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextViewWidget(
                cachePost.title,
                maxLine: 1,
              ),
            ),
            IconButton(
              onPressed: () => function(cachePost),
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
