class AuthRequest {
  String? username;

  AuthRequest({this.username});

  AuthRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    return data;
  }
}

class AuthRequest2 {
  String? username;

  AuthRequest2({this.username});

  AuthRequest2.fromJson(Map<String, dynamic> json) {
    username = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = username;
    return data;
  }
}

class AuthResponse {
  bool? exists;

  AuthResponse({this.exists});

  AuthResponse.fromJson(Map<String, dynamic> json) {
    exists = json['exists'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exists'] = exists;
    return data;
  }
}
