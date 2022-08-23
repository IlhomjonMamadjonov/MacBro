import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import '../../../../../../routes/app_routes.dart';

class ItemSubCategoryWidget extends StatelessWidget {
  const ItemSubCategoryWidget({Key? key, this.id, this.name, this.image})
      : super(key: key);
  final String? id;
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.limitedProductsPage, arguments: [id, name]);
      },
      borderRadius: AppUtils.kBorderRadius8,
      child: Ink(
        padding: AppUtils.kAllPadding16,
        width: 165.5,
        height: 169,
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ink.image(
                image: NetworkImage(image ??
                    'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg'),
                height: 95,
                width: 102),
            Text(
              name ?? 'Null',
              textAlign: TextAlign.center,
              style: AppTextStyles.productTitle,
            ),
          ],
        ),
      ),
    );
  }
}
