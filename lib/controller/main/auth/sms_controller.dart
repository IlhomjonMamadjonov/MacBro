import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/controller/main/profile/profile_controller.dart';
import 'package:sample_app_getx/data/models/passcode_confirm/passcode_confirm_request.dart';
import 'package:sample_app_getx/data/models/passcode_confirm/passcode_confirm_response.dart';
import 'package:sample_app_getx/data/repository/auth/auth_repository.dart';

import '../../../data/models/auth/user_request.dart';
import '../../../data/models/auth/user_response.dart';

class SmsController extends BaseController {
  final AuthRepository authRepository = AuthRepository();
  final ProfileController userMe = ProfileController();
  String? id;

  TextEditingController smsController = TextEditingController();

  Future<bool> passCodeConfirm(String passcodeToken) async {
    setLoading(true);
    final result = await authRepository.passCodeConfirm(
      passcode: PasscodeConfirmRequest(
        passcode: smsController.text,
        passcodeToken: passcodeToken,
      ),
    );
    if (result is PasscodeConfirmResponse) {
      final _result = await userMe.userMe(
        result.data?.token?.accessToken ?? '',
        result.data?.token?.refreshToken ?? '',
      );
      setLoading(false);

      return _result;
    } else {
      Get.snackbar('error'.tr, result.toString());
      setLoading(false);
      return false;
    }
  }
  Future<void> createUser(String firstname, String lastname, String phoneNumber,
      String? accessToken) async {
    var userRequest = UserRequest(
      firstName: firstname,
      lastName: lastname,
      phoneNumber: phoneNumber,
      profileImage: "",
    );
    setLoading(true);
    final result = await authRepository.createUser(
        auth: "Bearer $accessToken", userRequest: userRequest);
    setLoading(false);
    if (result is UserResponse) {
      id = result.id;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }
}
