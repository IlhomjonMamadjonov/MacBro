import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class SettingsController extends BaseController {
  Future showModalBottomSheetFunction(BuildContext context) =>
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              height: 250,
              padding: const EdgeInsets.all(12.0),
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.0),
                  topRight: Radius.circular(13.0),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/ic_russia.svg"),
                    ),
                    onTap: () async {
                      await Get.updateLocale(const Locale('ru'));
                      await LocalSource.getInstance().setLocale('ru');
                      update();

                      Get.back();
                    },
                    title: const Text(
                      "Русский",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: LocalSource.getInstance().getLocale() == 'ru'
                        ? SvgPicture.asset('assets/svg/ic_done.svg')
                        : AppUtils.kBox,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/ic_uzbekistan.svg"),
                    ),
                    onTap: () async {
                      await Get.updateLocale(const Locale('uz'));
                      await LocalSource.getInstance().setLocale('uz');
                      update();
                      Get.back();
                    },
                    title: const Text(
                      "O'zbekcha",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: LocalSource.getInstance().getLocale() == 'uz'
                        ? SvgPicture.asset('assets/svg/ic_done.svg')
                        : AppUtils.kBox,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: SvgPicture.asset("assets/svg/ic_english.svg"),
                    ),
                    onTap: () async {
                      await Get.updateLocale(const Locale('en'));
                      await LocalSource.getInstance().setLocale('en');
                      update();
                      Get.back();
                    },
                    title: const Text(
                      "English",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: LocalSource.getInstance().getLocale() == 'en'
                        ? SvgPicture.asset('assets/svg/ic_done.svg')
                        : AppUtils.kBox,
                  ),
                ],
              ),
            ),
          );
        },
      );

  Future showDialogFunction(BuildContext context) => showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("log_out_text".tr),
          ),
          actions: [
            CupertinoDialogAction(
              child: Text("cancel".tr),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              child: Text("yes".tr),
              onPressed: () {
                LocalSource.getInstance().removeProfile();
                Get.offAllNamed(Routes.main);
              },
            ),
          ],
        ),
      );

  void updateState() {
    update();
  }
}
