import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/models/register/register_request.dart';
import 'package:sample_app_getx/data/models/register/register_response.dart';
import '../../../data/repository/auth/auth_repository.dart';

class AuthController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final AuthRepository? authRepository;

  AuthController({this.authRepository});
  bool registering =false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(
    mask: ' ## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  Future<void> userRegister(String phone) async {
    var userRegisterRequest = RegisterRequest(
        clientTypeId: Constants.clientTypeId,
        roleId: Constants.roleId,
        phone: phone,
        email: '',
        password: '',
        login: '');
    setLoading(true);
    final result = await authRepository?.userRegister(
        userRegisterRequest: userRegisterRequest);
    setLoading(false);
    if (result is RegisterResponse) {
      debugPrint("User register ==> ${result.data}");
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  void isRegistering(bool reg) {
    registering = reg;
    update();
  }
}
