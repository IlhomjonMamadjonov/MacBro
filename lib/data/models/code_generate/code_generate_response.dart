class GenerateResponse {
  int? code;
  String? message;
  Data? data;

  GenerateResponse({this.code, this.message, this.data});

  GenerateResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? userFound;
  ClientType? clientType;
  User? user;
  Null? userSessions;
  String? passcodeToken;
  int? period;

  Data(
      {this.userFound,
      this.clientType,
      this.user,
      this.userSessions,
      this.passcodeToken,
      this.period});

  Data.fromJson(Map<String, dynamic> json) {
    userFound = json['user_found'];
    clientType = json['client_type'] != null
        ? ClientType.fromJson(json['client_type'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    passcodeToken = json['passcode_token'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_found'] = userFound;
    if (clientType != null) {
      data['client_type'] = clientType!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['user_sessions'] = userSessions;
    data['passcode_token'] = passcodeToken;
    data['period'] = period;
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
