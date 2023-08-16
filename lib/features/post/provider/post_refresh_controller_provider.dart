import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod/riverpod.dart';

final postRefreshControllerProvider = Provider<RefreshController>((ref) {
  final refreshController = RefreshController();
  ref.onDispose(refreshController.dispose);
  return refreshController;
});
