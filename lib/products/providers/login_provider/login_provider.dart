import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth_repo/auth_repo.dart';
import '../../local_db/auth_local_db/auth_local_service.dart';
import '../../models/user/login_request_model.dart';
import '../../service/auth_service.dart';

final loginProvider = StateNotifierProvider<LoginProvider, bool>((ref) =>
    LoginProvider(
        AuthRepoImpl(AuthService(), AuthLocalDBImpl()), AuthLocalDBImpl()));

class LoginProvider extends StateNotifier<bool> {
  final AuthRepoImpl _authRepo;
  final AuthLocalDBImpl _authdb;

  LoginProvider(this._authRepo, this._authdb) : super(false);

  Future<bool> call(LoginRequestModel param) async {
    state = await _authRepo.loginUser(param.toJson());
    return state;
  }

  Future<void> logoutUser() async {
    await _authRepo.logOut();
    String? session = await _authdb.getSessionId();
    if (session == null) {
      state = false;
    }
  }
}
