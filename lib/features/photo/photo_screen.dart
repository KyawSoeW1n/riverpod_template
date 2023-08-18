import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_testing/core/network/exception/not_found_exception.dart';
import 'package:riverpod_testing/features/photo/provider/photo_scroll_controller_provider.dart';

import '../../core/base/base_view.dart';
import '../../widget/common/common_app_bar.dart';
import '../post/widgets/error_handling_widget.dart';
import 'notifier/photo_notifier.dart';

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
    // final refreshController = ref.watch(photoRefreshControllerProvider);
    final scrollController = ref.watch(photoScrollControllerProvider);
    final photoProvider = ref.watch(photoNotifierProvider);
    return Consumer(
      builder: (context, ref, _) {
        return SmartRefresher(
          onRefresh: () =>
              ref.read(photoNotifierProvider.notifier).getPhotoList(
                    refreshController: refreshController,
                    forceRefresh: true,
                  ),
          enablePullUp: true,
          enablePullDown: true,
          onLoading: () => ref
              .read(photoNotifierProvider.notifier)
              .getPhotoList(refreshController: refreshController),
          controller: refreshController,
          child: photoProvider.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            error: (e) => ErrorHandlingWidget(
              exception: NotFoundException("Not Found", "NOT FOUND"),
            ),
            success: (content) => CustomScrollView(
              controller: scrollController,
              slivers: [
                if (content != null)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CachedNetworkImage(
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                          imageUrl: content[index],
                        );
                      },
                      childCount: content.length, // Number of items in the list
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
