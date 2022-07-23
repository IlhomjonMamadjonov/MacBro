import 'package:flutter/material.dart';
import 'package:sample_app_getx/controller/main/auth/sms_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/custom_button/custom_button.dart';
import 'package:sample_app_getx/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:get/get.dart';

class SmsPage extends GetView<SmsController> {
  SmsPage({Key? key}) : super(key: key);
  String code = "";
  bool button = false;

  @override
  Widget build(BuildContext context) {
    String passcodeToken = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("login".tr),
          elevation: 0,
        ),
        body: GetBuilder<SmsController>(
          // initState: (_) {},
          builder: (controller) {
            return ModalProgressHUD(
              inAsyncCall: controller.isLoading,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 136,
                      width: 343,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          Text('enter_sms_code'.tr),
                          const SizedBox(height: 10),
                          PinFieldAutoFill(
                            codeLength: 6,
                            autoFocus: true,
                            controller: controller.smsController,
                            decoration: const BoxLooseDecoration(
                              strokeColorBuilder: FixedColorBuilder(
                                Colors.blue,
                              ),
                              radius: Radius.circular(10),
                            ),
                            currentCode: code,
                            onCodeSubmitted: (code) async {},
                            onCodeChanged: (code) async {
                              if (code!.length == 6) {
                                button = true;
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                final result =
                                    await controller.passCodeConfirm(passcodeToken);
                                if (result) {
                                  Get.offAllNamed(Routes.main);
                                } else {
                                  Get.snackbar('error'.tr, result.toString());
                                }
                              }
                            },
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('send_sms_code_again'.tr),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    CustomButton(
                      child: Text("login".tr),
                      onTap: () async {
                        if (button) {
                          final result =
                              await controller.passCodeConfirm(passcodeToken);
                          if (result) {
                            Get.offAllNamed(Routes.main);
                          } else {
                            Get.snackbar('error'.tr, result.toString());
                          }
                        } else {
                          return null;
                        }
                        // final result = await controller.passCodeConfirm()
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
