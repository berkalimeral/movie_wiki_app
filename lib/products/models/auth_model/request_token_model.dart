class RequestTokenModel {
  bool? success;
  String? expiresAt;
  String? requestToken;

  RequestTokenModel({this.success, this.expiresAt, this.requestToken});

  RequestTokenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    expiresAt = json['expires_at'];
    requestToken = json['request_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['expires_at'] = expiresAt;
    data['request_token'] = requestToken;
    return data;
  }
}
