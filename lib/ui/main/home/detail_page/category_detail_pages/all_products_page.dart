import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/ui/main/home/detail_page/category_detail_pages/widgets/item_product_favourite.dart';
import 'package:sample_app_getx/ui/main/home/widgets/loading_widget.dart';

class AllProductsPage extends GetView<HomeController> {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    final String id = data[0] ?? "";
    final String? name = data[1] ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text(name!),
      ),
      body: GetBuilder<HomeController>(initState: (_) {
        controller.getProductVariants(id);
      }, builder: (controller) {
        if (controller.isLoading || controller.allProductVariants.isEmpty) {
          return const LoadingWidget();
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            scrollDirection: Axis.vertical,
            itemCount: controller.allProductVariants.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1/1.25,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              var id = controller.allProductVariants[index].id;
              var name = controller.allProductVariants[index].name;
              var image = controller.allProductVariants[index].image;
              var price =
                  controller.allProductVariants[index].price?.uzsPrice;
              return ItemProductFavouriteWidget(
                  id: id, name: name, image: image, price: price);
            },
          );
        }
      }),
    );
  }
}
