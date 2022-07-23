import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/settings_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/ui/main/profile/widgets/profiel_details.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool notif = false;
    bool sound = false;
    // var localSource = LocalSource.getInstance();
    return GetBuilder<SettingsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("settings".tr),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  controller.showAlertDialog(context);
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  borderRadius: AppUtils.kBorderRadius16,
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // language
                    ProfileDetails(
                      onTap: () {
                        controller.showModalBottomSheetFunction(context);
                      },
                      leadingImg: "language",
                      title: "language".tr,
                      trailing: SvgPicture.asset(
                          LocalSource.getInstance().getLocale() == 'uz'
                              ? 'assets/svg/ic_uzbekistan.svg'
                              : LocalSource.getInstance().getLocale() == 'ru'
                                  ? 'assets/svg/ic_russia.svg'
                                  : 'assets/svg/ic_english.svg'),
                    ),

                    // remove cache
                    ProfileDetails(
                      leadingImg: "remove",
                      title: "clear_cache".tr,
                    ),

                    // notif
                    ProfileDetails(
                      leadingImg: "ring",
                      title: "alerts".tr,
                      trailing: CupertinoSwitch(
                          value: notif,
                          activeColor: AppColors.blue,
                          onChanged: (v) {
                            notif = !notif;
                            controller.update();
                          }),
                    ),

                    // Sound
                    ProfileDetails(
                      leadingImg: "voice",
                      title: "sound".tr,
                      trailing: CupertinoSwitch(
                        value: sound,
                        activeColor: AppColors.blue,
                        onChanged: (v) {
                          sound = !sound;
                          controller.update();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
