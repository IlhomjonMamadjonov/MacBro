import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sample_app_getx/controller/main/auth/auth_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/text_fields/custom_phone_text_field.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

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
        child: Column(
          children: [
            AppUtils.kBoxHeight16,

            // name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomPhoneTextField(
                labelText: "name".tr,
                hintText: "enter_your_name".tr,
                required: true,
                fillColor: AppColors.textfield,
                controller: controller.nameController,
              ),
            ),

            // surname
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomPhoneTextField(
                labelText: "surname".tr,
                required: true,
                fillColor: AppColors.textfield,
                controller: controller.surNameController,
                hintText: "enter_your_surname".tr,
              ),
            ),

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
                controller: controller.registerPhoneController,
              ),
            ),
          ],
        ),
      ),
      bottomSheet: button(),
    );
  }

  CustomButton button() {
    return CustomButton(
      margin: const EdgeInsets.all(16.0),
      child: Text("registration".tr),
      onTap: () {
        Get.toNamed(Routes.sms);
      },
    );
  }
}
