import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/limited_products_controller.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/ui/main/home/widgets/loading_widget.dart';
import '../../../../../routes/app_routes.dart';
import 'widgets/limited_products_page_widget.dart';

class LimitedProductsPage extends GetView<LimitedProductsController> {
  const LimitedProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    final String id = data[0] ?? "";
    final String? name = data[1] ?? "";
    return Scaffold(
        appBar: AppBar(title: Text(name!)),
        body: SafeArea(
          child: GetBuilder<LimitedProductsController>(initState: (_) {
            controller.getLimitedProducts(id);
          }, builder: (_) {
            return controller.isLoading
                ? const LoadingWidget()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      children: [
                        // all products button
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.allProductsPage,
                                arguments: [id, name]);
                          },
                          borderRadius: BorderRadius.circular(8),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: const BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius8,
                              color: AppColors.white,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/svg/ic_all_products.svg"),
                                const SizedBox(width: 16),
                                 Expanded(
                                  child: Text(
                                    "all_products".tr,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                SvgPicture.asset(
                                    "assets/svg/ic_arrow_blue.svg"),
                              ],
                            ),
                          ),
                        ),
                        AppUtils.kBoxHeight16,

                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1/1.1,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12),
                          itemBuilder: (context, index) {
                            var id = controller.limitedProducts[index].id;
                            var name = controller.limitedProducts[index].name;
                            var image = controller.limitedProducts[index].image;
                            var price = controller
                                .limitedProducts[index].cheapestPrice;
                            return LimitedProductsPageWidget(
                                id: id, name: name, image: image, price: price);
                          },
                          itemCount: controller.limitedProducts.length,
                        ),
                      ],
                    ),
                  );
          }),
        ));
  }
}
