import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import '../../../../../../data/models/categories/category_response.dart';
import '../../../../../../routes/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, this.name, this.id, this.image, this.children})
      : super(key: key);
  final String? name;
  final String? id;
  final String? image;
  final List<dynamic>? children;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius8,
      onTap: () {
        if (children != null) {
          Get.toNamed(Routes.subCategoryPage, arguments: [children, name]);
        } else {
          Get.toNamed(Routes.limitedProductsPage, arguments: [id, name]);
        }
      },
      child: Ink(
        width: 165.5,
        padding: AppUtils.kAllPadding16,
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
          color: AppColors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ink.image(
                height: 95,
                width: 102,
                image: NetworkImage(image ??
                    'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg')),
            // name
            Text(
              name ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyles.productTitle,
            ),
          ],
        ),
      ),
    );
  }
}
