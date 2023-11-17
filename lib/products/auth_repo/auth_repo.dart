import 'dart:developer';

import '../local_db/auth_local_db/auth_local_service.dart';
import '../models/auth_model/request_token_model.dart';
import '../service/auth_service.dart';

abstract class AuthRepo {
  Future<bool> loginUser(Map<String, dynamic> body);
  Future<void> logOut();
}

class AuthRepoImpl extends AuthRepo {
  final AuthService _authService;
  final AuthLocalDB _authLocalDb;

  AuthRepoImpl(this._authService, this._authLocalDb);

  Future<RequestTokenModel> _getRequestToken() async {
    final response = await _authService.getRequestToken();
    return response;
  }

  @override
  Future<void> logOut() {
    // TODO: implement loginOut
    throw UnimplementedError();
  }

  @override
  Future<bool> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token = requestTokenEitherResponse.requestToken;

    try {
      body.putIfAbsent('request_token', () => token);
      final validateWithLogin = await _authService.validateWithLogin(body);
      final sessionId =
          await _authService.createSession(validateWithLogin!.toJson());
      log('Session id : $sessionId');
      if (sessionId != null) {
        await _authLocalDb.saveSessionId(sessionId);
        log('Session id : Success');
        return true;
      } else {
        log('Session id : Fail');
        return false;
      }
    } catch (e) {
      log('Session id : $e');
      return false;
    }
  }
}
