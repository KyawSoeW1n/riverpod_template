import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/state.dart';
import 'package:riverpod_testing/domain/user/user_usecase_impl.dart';

final userNotifierProvider =
    StateNotifierProvider.autoDispose<UserNotifier, State<String>>((ref) {
  return UserNotifier(ref.read(userUseCaseImpl));
});

class UserNotifier extends StateNotifier<State<String>> {
  final UserUseCaseImpl _userUseCaseImpl;

  UserNotifier(
    this._userUseCaseImpl,
  ) : super(const State.loading()) {
    Future.microtask(() => getUserData());
  }

  void getUserData() {
    state = State.success(_userUseCaseImpl.getUser());
  }

  void setUserData(String userData) {
    _userUseCaseImpl.saveUser(userData);
    getUserData();
  }
}
