import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/profile_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/main/profile/widgets/profiel_details.dart';

import 'widgets/profile_appbar_widget.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileAppBar(),
              SizedBox(height: Get.width * 0.03),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  children: [
                    ProfileDetails(
                      leadingImg: "ic_change_profile",
                      title: "change_profile".tr,
                    ),
                    ProfileDetails(
                      leadingImg: "ic_profile_order",
                      title: "history_orders".tr,
                    ),
                    ProfileDetails(
                      leadingImg: "ic_profile_history",
                      title: "installment_history".tr,
                    ),
                    ProfileDetails(
                      leadingImg: "ic_profile_calculate",
                      title: "installment_calculator".tr,
                    ),
                    ProfileDetails(
                      leadingImg: "ic_profile_shopping",
                      title: "shops".tr,
                    ),
                    ProfileDetails(
                      onTap: () {
                        Get.toNamed(Routes.settings);
                      },
                      leadingImg: "ic_profile_settings",
                      title: "settings".tr,
                    ),
                    ProfileDetails(
                      leadingImg: "ic_profile_contacts",
                      title: "contacts".tr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
