import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';

import '../data/data_source/local_source.dart';
import '../data/models/limited_product_response.dart';
import '../data/repository/home/home_repository.dart';

class LimitedProductsController extends BaseController
    with GetSingleTickerProviderStateMixin {
  List<Product> _limitedProducts = [];
  String lang =  LocalSource.getInstance().getLocale();

// LIMITED PRODUCTS (BY CATEGORY ID)
  void getLimitedProducts(String categoryId) async {
    setLoading(true);
    var result = await HomeRepository(apiClient: ApiClient.getInstance())
        .getLimitedProducts(
            categoryId: categoryId, lang: lang, limit: '10', page: "1");
    setLoading(false);
    if (result is ResponseLimitedProducts) {
      _limitedProducts = result.products!;
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<Product> get limitedProducts => _limitedProducts;

  set limitedProducts(List<Product> value) {
    _limitedProducts = value;
    update();
  }
}
