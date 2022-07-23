import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/profile_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      var localSource = LocalSource.getInstance().getCustomer();
      return Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 0.4,
              blurRadius: 1.1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: SizedBox(
          width: Get.width - 88,
          height: Get.height * 0.133,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${localSource.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 22.0),
              ),
              Text(
                "${localSource.lastName}",
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 22.0),
              ),
              Text(
                "${localSource.phone}",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17.0,
                    color: Colors.grey.withOpacity(0.7)),
              )
            ],
          ),
        ),
      );
    });
  }
}
