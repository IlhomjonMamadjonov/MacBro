import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/auth/sing_in_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:sample_app_getx/core/custom_widgets/text_fields/custom_phone_text_field.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class SignInPage extends GetView<SingInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String num = "+998";

    return Scaffold(
      appBar: AppBar(
        title: Text("login".tr),
      ),
      body: GetBuilder<SingInController>(
        // initState: (_) {},
        builder: (controller) {
          return ModalProgressHUD(
            inAsyncCall: controller.isLoading,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  AppUtils.kBoxHeight16,

                  // number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: CustomPhoneTextField(
                      inputFormatters: [controller.maskFormatter],
                      labelText: "phone_number".tr,
                      prefixText: "+998",
                      keyboardType: TextInputType.number,
                      autoFocus: true,
                      required: true,
                      fillColor: AppColors.textfield,
                      controller: controller.phoneController,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomButton(
                      child: Text("login".tr),
                      onTap: () async {
                        if (controller.formKey.currentState!.validate()) {
                          final result = await controller.postPhoneNumber(
                            (num + controller.phoneController.text)
                                .split(" ")
                                .join()
                                .toString(),
                          );
                          if (result == null) {
                          } else if (result.isNotEmpty) {
                            Get.toNamed(Routes.sms, arguments: result);
                          } else {
                            Get.toNamed(Routes.auth);
                          }
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
