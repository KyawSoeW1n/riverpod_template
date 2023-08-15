import 'package:pull_to_refresh/pull_to_refresh.dart';

extension RefreshControllerExtension on RefreshController {
  void resetRefreshController() {
    if (isLoading) {
      loadComplete();
    }

    if (isRefresh) {
      refreshCompleted();
    }
  }
}
