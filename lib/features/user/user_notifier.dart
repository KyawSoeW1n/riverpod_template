import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/core/state.dart';
import 'package:riverpod_testing/domain/user/user_usecase_impl.dart';

import '../../domain/user/user_usecase.dart';

final userNotifierProvider =
    StateNotifierProvider.autoDispose<UserNotifier, State<String>>((ref) {
  return UserNotifier(ref.read(userUseCaseImpl));
});

class UserNotifier extends StateNotifier<State<String>> {
  final UserUseCase _userUseCase;

  UserNotifier(
    this._userUseCase,
  ) : super(const State.loading()) {
    Future.microtask(() => getUserData());
  }

  void getUserData() {
    state = State.success(_userUseCase.getUser());
  }

  void setUserData(String userData) {
    _userUseCase.saveUser(userData);
    getUserData();
  }
}
