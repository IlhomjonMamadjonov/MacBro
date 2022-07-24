import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/ui/main/home/detail_page/category_detail_pages/widgets/item_product_favourite.dart';
import 'package:sample_app_getx/ui/main/home/widgets/loading_widget.dart';
import '../../../../../controller/all_products_controller.dart';

class AllProductsPage extends GetView<AllProductsController> {
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
      body: SafeArea(
        child: GetBuilder<AllProductsController>(initState: (_) {
          print(id);
          controller.getProductVariants(id);
        }, builder: (_) {
          return controller.isLoading
              ? const LoadingWidget()
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  itemCount: controller.allProductVariants.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1 / 1.35,
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
        }),
      ),
    );
  }
}
