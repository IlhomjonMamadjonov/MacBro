import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/splash/splash_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (ctr) => Scaffold(
        body: Center(
          child: RichText(
            text: const TextSpan(
              text: 'MacBro',
              style: TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 48),
              children: [
                TextSpan(
                  text: '\nFor clients',
                  style: AppTextStyles.appBarTitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
