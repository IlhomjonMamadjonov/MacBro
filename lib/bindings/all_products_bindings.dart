import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/category/all_products_controller.dart';
class AllProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProductsController>(() => AllProductsController(),
        fenix: true);
  }
}
