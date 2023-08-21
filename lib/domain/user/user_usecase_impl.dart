import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_testing/data_source/local/app_database.dart';

import 'user_usecase.dart';

final userUseCaseImpl = Provider<UserUseCaseImpl>(
  (ref) => UserUseCaseImpl(
    ref.watch(databaseService),
  ),
);

class UserUseCaseImpl extends UserUseCase {
  final DatabaseService _databaseService;

  UserUseCaseImpl(
    this._databaseService,
  );

  @override
  Future<void> saveUser(String userData) async {
    _databaseService.saveUserDataBox(userData);
  }

  @override
  String getUser() {
    final user = _databaseService.getUserBox();
    return user;
  }
}
