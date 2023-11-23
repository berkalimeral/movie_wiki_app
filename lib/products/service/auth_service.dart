import 'dart:developer';

import 'package:uni_society_app/products/models/auth_model/request_token_model.dart';

import '../../core/base/api_client.dart';
import '../../core/base/base_service.dart';
import '../network/network_values.dart';

class AuthService extends BaseAuthService {
  @override
  Future<String?> createSession(Map<String, dynamic> requestBody) async {
    final response =
        await ApiClient.post(EndPointsAuth.createSession, param: requestBody);
    return response['success'] ? response['session_id'] : null;
  }

  @override
  Future<bool> deleteSession(String? body) async {
    final response = await ApiClient.delete(EndPointsAuth.deleteSession, body);
    return response['success'] ?? false;
  }

  @override
  Future<RequestTokenModel> getRequestToken() async {
    final responseBody = await ApiClient.get(EndPointsAuth.authToken);
    return RequestTokenModel.fromJson(responseBody);
  }

  @override
  Future<RequestTokenModel?> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    try {
      final responseBody = await ApiClient.post(EndPointsAuth.validateWithLogin,
          param: requestBody);
      log('Validate Login responseBody: $responseBody');
      return RequestTokenModel.fromJson(responseBody);
    } catch (e) {
      log('ValidateWithLogin: $e');
      return null;
    }
  }
}
