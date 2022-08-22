import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
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
                      style: AppTextStyles.checkoutOrderBranchesItemName,
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
                      style: AppTextStyles.checkoutOrderBranchesItemName,
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
                      style: AppTextStyles.checkoutOrderBranchesItemName,
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

  Future showAlertDialog(BuildContext context) => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Column(
            children: [
              Text(
                "log_out_text".tr,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      minWidth: 120,
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppUtils.kBorderRadius8,
                      ),
                      color: AppColors.white,
                      child: Text("cancel".tr)),
                  const Spacer(),
                  MaterialButton(
                      onPressed: () {
                        LocalSource.getInstance().removeProfile();
                        Get.offAllNamed(Routes.main);
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: AppUtils.kBorderRadius8,
                      ),
                      color: AppColors.blue,
                      minWidth: 130,
                      child: Text(
                        "yes".tr,
                        style: AppTextStyles.productDetailButton,
                      )),
                ],
              )
            ],
          ),
        ),
      );
}
