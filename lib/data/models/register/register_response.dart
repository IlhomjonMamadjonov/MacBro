class RegistrResponse {
  int? code;
  String? message;
  Null? error;
  String? data;

  RegistrResponse({this.code, this.message, this.error, this.data});

  RegistrResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    error = json['error'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['error'] = error;
    data['data'] = this.data;
    return data;
  }
}
