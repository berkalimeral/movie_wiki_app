import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth_repo/auth_repo.dart';
import '../../local_db/auth_local_db/auth_local_service.dart';
import '../../models/user/login_request_model.dart';
import '../../service/auth_service.dart';

final loginProvider = Provider(
    (ref) => LoginProvider(AuthRepoImpl(AuthService(), AuthLocalDBImpl())));

class LoginProvider extends ChangeNotifier {
  final AuthRepoImpl _authRepo;

  LoginProvider(this._authRepo);

  Future<bool> call(LoginRequestModel param) async {
    return await _authRepo.loginUser(param.toJson());
  }
}
