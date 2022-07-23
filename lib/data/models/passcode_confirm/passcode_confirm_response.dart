class PasscodeConfirmResponse {
  int? code;
  String? message;
  Null? error;
  Data? data;

  PasscodeConfirmResponse({this.code, this.message, this.error, this.data});

  PasscodeConfirmResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    error = json['error'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  ClientType? clientType;
  bool? userFound;
  User? user;
  Null? userSessions;
  Token? token;

  Data(
      {this.clientType,
      this.userFound,
      this.user,
      this.userSessions,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    clientType = json['client_type'] != null
        ? ClientType.fromJson(json['client_type'])
        : null;
    userFound = json['user_found'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userSessions = json['user_sessions'];
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clientType != null) {
      data['client_type'] = clientType!.toJson();
    }
    data['user_found'] = userFound;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['user_sessions'] = userSessions;
    if (token != null) {
      data['token'] = token!.toJson();
    }
    return data;
  }
}

class ClientType {
  String? id;
  String? name;
  String? strategy;
  String? confirmBy;
  bool? phone;
  bool? email;
  bool? login;
  bool? selfRegister;
  bool? selfRecover;

  ClientType(
      {this.id,
      this.name,
      this.strategy,
      this.confirmBy,
      this.phone,
      this.email,
      this.login,
      this.selfRegister,
      this.selfRecover});

  ClientType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    strategy = json['strategy'];
    confirmBy = json['confirm_by'];
    phone = json['phone'];
    email = json['email'];
    login = json['login'];
    selfRegister = json['self_register'];
    selfRecover = json['self_recover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['strategy'] = strategy;
    data['confirm_by'] = confirmBy;
    data['phone'] = phone;
    data['email'] = email;
    data['login'] = login;
    data['self_register'] = selfRegister;
    data['self_recover'] = selfRecover;
    return data;
  }
}

class User {
  String? id;
  String? clientTypeId;
  String? roleId;
  String? password;
  int? active;
  String? expiresAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.clientTypeId,
      this.roleId,
      this.password,
      this.active,
      this.expiresAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientTypeId = json['client_type_id'];
    roleId = json['role_id'];
    password = json['password'];
    active = json['active'];
    expiresAt = json['expires_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['client_type_id'] = clientTypeId;
    data['role_id'] = roleId;
    data['password'] = password;
    data['active'] = active;
    data['expires_at'] = expiresAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Token {
  String? accessToken;
  String? refreshToken;
  String? createdAt;
  String? updatedAt;
  String? expiresAt;
  int? refreshInSeconds;

  Token(
      {this.accessToken,
      this.refreshToken,
      this.createdAt,
      this.updatedAt,
      this.expiresAt,
      this.refreshInSeconds});

  Token.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expiresAt = json['expires_at'];
    refreshInSeconds = json['refresh_in_seconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['expires_at'] = expiresAt;
    data['refresh_in_seconds'] = refreshInSeconds;
    return data;
  }
}
