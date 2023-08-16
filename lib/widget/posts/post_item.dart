import 'package:flutter/material.dart';
import 'package:riverpod_testing/data_model/vo/post_vo.dart';

class PostItem extends StatelessWidget {
  final PostVO postVO;
  final Function function;
  final bool isFav;

  const PostItem(
    this.postVO,
    this.function, {
    this.isFav = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(postVO.title),
        ),
        IconButton(
          onPressed: () => function(postVO.id, postVO.title),
          icon: isFav
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_outline),
        )
      ],
    );
  }
}
