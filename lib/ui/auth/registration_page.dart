import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/auth/auth_controller.dart';
import 'package:sample_app_getx/controller/main/auth/sing_in_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/text_fields/custom_phone_text_field.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/auth/sing_in_password_confirm/sms_confirm_page.dart';

import '../../core/custom_widgets/text_fields/custom_text_field.dart';
import '../../core/theme/app_utils.dart';

class RegistrationPage extends GetView<AuthController> {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("registration".tr),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              AppUtils.kBoxHeight16,
              // name
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomTextField(
                  labelText: "name".tr,
                  hintText: "enter_your_name".tr,
                  required: true,
                  fillColor: AppColors.textfield,
                  controller: controller.firstNameController,
                ),
              ),

              // surname
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomTextField(
                    labelText: "surname".tr,
                    required: true,
                    fillColor: AppColors.textfield,
                    controller: controller.lastNameController,
                    hintText: "enter_your_surname".tr,
                  )),

              //phone number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomPhoneTextField(
                    labelText: "phone_number".tr,
                    required: true,
                    hintText: "enter_your_number".tr,
                    prefixText: "+998",
                    inputFormatters: [controller.maskFormatter],
                    keyboardType: TextInputType.number,
                    fillColor: AppColors.textfield,
                    controller: controller.phoneController),
              )
            ]),
          ),
        ),
      ),
      bottomSheet: button(),
    );
  }

  CustomButton button() {
    String number = "+998";
    return CustomButton(
      margin: const EdgeInsets.all(16.0),
      child: Text("registration".tr),
      onTap: () async {
        if (controller.formKey.currentState!.validate()) {
          await controller.userRegister(
              (number + controller.phoneController.text)
                  .split(" ")
                  .join()
                  .toString());
          await Get.find<SingInController>().postPhoneNumber(
              (number + controller.phoneController.text)
                  .split(" ")
                  .join()
                  .toString());
          controller.isRegistering(true);
          Get.to(SmsPage(
            passcodeToken: Get.find<SingInController>().token,
            firstName: controller.firstNameController.text.tr,
            lastName: controller.lastNameController.text.tr,
            phoneNumber: controller.phoneController.text.tr,
          ));
        }
      },
    );
  }
}
