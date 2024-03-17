import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/widget/common/text_view_widget.dart';

import '../../../core/locale/localization_helper.dart';
import '../../../data_source/local/app_database.dart';
import '../../../widget/posts/post_item.dart';
import '../notifier/post_notifier.dart';
import '../provider/post_scroll_controller_provider.dart';
import 'error_handling_widget.dart';

class CachePostListWidget extends ConsumerWidget {
  const CachePostListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(postScrollControllerProvider);
    final postListStreamProvider = ref.watch(postsStreamProvider);
    return postListStreamProvider.maybeWhen(
      data: (content) => CustomScrollView(
        controller: scrollController,
        slivers: [
          content.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return PostItem(
                        content[index],
                        ref
                            .read(postNotifierProvider.notifier)
                            .changePostStatus,
                      );
                    },
                    childCount: content.length, // Number of items in the list
                  ),
                )
              : SliverFillRemaining(
                  child: Center(
                    child: TextViewWidget(
                      '${LocalizationHelper.of(context)?.noData}',
                    ),
                  ),
                )
        ],
      ),
      error: (e, _) => ErrorHandlingWidget(exception: e),
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
