import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/features/photo/provider/photo_provider.dart';
import 'package:riverpod_testing/widget/common/loading_widget.dart';

import '../../core/base/base_view.dart';
import '../../widget/common/common_app_bar.dart';

class PhotoScreen extends BaseView {
  PhotoScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const CommonAppBar(
      "Photo",
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final refreshController = RefreshController();
    final photoProvider = ref.watch(photoNotifierProvider);
    return Consumer(
      builder: (context, ref, _) {
        return SmartRefresher(
          onRefresh: () async =>
              await ref.read(photoNotifierProvider.notifier).getPhotoList(),
          // enablePullUp: true,
          enablePullDown: true,
          // onLoading: () =>
          //     ref.read(photoNotifierProvider.notifier).getPhotoList(),
          controller: refreshController,
          child: photoProvider.maybeWhen(
            loading: () => const LoadingWidget(),
            orElse: () {
              return const SizedBox();
            },
            success: (content) => ListView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                  imageUrl: content[index],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
