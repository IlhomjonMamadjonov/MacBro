class PasscodeConfirmRequest {
  String? passcode;
  String? passcodeToken;

  PasscodeConfirmRequest({this.passcode, this.passcodeToken});

  PasscodeConfirmRequest.fromJson(Map<String, dynamic> json) {
    passcode = json['passcode'];
    passcodeToken = json['passcode_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['passcode'] = passcode;
    data['passcode_token'] = passcodeToken;
    return data;
  }
}
