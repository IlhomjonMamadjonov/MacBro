import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';

class ProfileDetails extends StatelessWidget {
  final String leadingImg;
  final Function? onTap;
  final String title;
  Widget? trailing;
  ProfileDetails({
    Key? key,
    required this.leadingImg,
    required this.title,
     this.onTap,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
      child: ListTile(
        onTap: () => onTap!(),
        leading: SvgPicture.asset("assets/svg/$leadingImg.svg"),
        title: Text(title, style: AppTextStyles.profileDetail),
        trailing:
            trailing ?? SvgPicture.asset("assets/svg/ic_profile_arrow.svg"),
      ),
    );
  }
}
