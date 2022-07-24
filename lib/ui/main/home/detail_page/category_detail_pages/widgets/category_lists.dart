import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';

import '../../category_detail_pages/widgets/category_item.dart';


class CategoryLists extends StatelessWidget {
  const CategoryLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 12, top: Get.width * 0.07),
                    child: Text(
                      "categories".tr,
                      style: AppTextStyles.categoryTitle,
                    ),
                  ),
                  AppUtils.kBoxHeight12,
                  GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12),
                      itemCount: controller.categories.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                            name: controller.categories[index].name,
                            id: controller.categories[index].id,
                            image: controller.categories[index].image,
                            children: controller.categories[index].children);
                      })
                ]);
          },
          childCount: 1,
        ),
      ),
    );
  }
}
