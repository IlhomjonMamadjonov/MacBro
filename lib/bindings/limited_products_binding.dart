import 'package:get/get.dart';

import '../controller/main/category/limited_products_controller.dart';


class LimitedProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LimitedProductsController>(() => LimitedProductsController(),fenix: true);
  }
}