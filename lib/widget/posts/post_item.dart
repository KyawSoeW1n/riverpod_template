import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final int id;
  final String title;
  final Function function;

  const PostItem(
    this.id,
    this.title,
    this.function, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title),
        ),
        IconButton(
          onPressed: () => function(id, title),
          icon: const Icon(Icons.favorite),
        )
      ],
    );
  }
}
