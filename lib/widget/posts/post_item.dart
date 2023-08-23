import 'package:flutter/material.dart';
import 'package:riverpod_testing/data_model/cache/cache_post.dart';
import 'package:riverpod_testing/widget/common/text_view_widget.dart';

import '../../core/resource/app_dimens.dart';

class PostItem extends StatelessWidget {
  final CachePost postVO;
  final Function function;

  const PostItem(
    this.postVO,
    this.function, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.margin16,
        vertical: AppDimens.margin8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimens.margin4,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppDimens.margin16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextViewWidget("${postVO.id}"),
                  TextViewWidget(
                    postVO.title,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () => function(postVO),
            icon: postVO.isFavourite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_outline),
          )
        ],
      ),
    );
  }
}
