class UserMeRequest {
  String? authorization;
  String? platformId;

  UserMeRequest({this.authorization, this.platformId});

  UserMeRequest.fromJson(Map<String, dynamic> json) {
    authorization = json['Authorization'];
    platformId = json['platform-id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Authorization'] = authorization;
    data['platform-id'] = platformId;
    return data;
  }
}
