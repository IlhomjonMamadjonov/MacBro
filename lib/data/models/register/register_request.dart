class RegisterRequest {
  String? clientTypeId;
  String? email;
  String? login;
  String? password;
  String? phone;
  String? roleId;

  RegisterRequest(
      {this.clientTypeId,
      this.email,
      this.login,
      this.password,
      this.phone,
      this.roleId});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    clientTypeId = json['client_type_id'];
    email = json['email'];
    login = json['login'];
    password = json['password'];
    phone = json['phone'];
    roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_type_id'] = clientTypeId;
    data['email'] = email;
    data['login'] = login;
    data['password'] = password;
    data['phone'] = phone;
    data['role_id'] = roleId;
    return data;
  }
}
