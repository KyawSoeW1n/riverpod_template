import 'package:flutter/material.dart';
import 'package:riverpod_testing/core/resource/app_dimens.dart';

import '../../../core/locale/localization_helper.dart';
import '../../../widget/common/text_view_widget.dart';

class FavouritePostItemCountWidget extends StatelessWidget {
  final int count;

  const FavouritePostItemCountWidget(this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.margin16,
        vertical: AppDimens.margin8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextViewWidget(
            '${LocalizationHelper.of(context)?.favouritePostCount}',
          ),
          TextViewWidget("$count"),
        ],
      ),
    );
  }
}
