import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import '../../../data/data_source/local_source.dart';
import '../../../data/models/all_product_variants_response.dart';
import '../../../data/repository/home/home_repository.dart';

class AllProductsController extends BaseController
    with GetSingleTickerProviderStateMixin {
  List<ProductVariants> _allProductVariants = [];
  String lang =  LocalSource.getInstance().getLocale();


  // PRODUCT VARIANTS (ALL PRODUCTS BY CATEGORY ID)
  void getProductVariants(String categoryId) async {
    setLoading(true);
    var result = await HomeRepository(apiClient: ApiClient.getInstance())
        .getProductVariants(
            categoryId: categoryId,
            active: true,
            limit: 1000,
            page: "1",
            lang: lang);
    setLoading(false);
    if (result is ResponseProductResponse) {
      result.productVariants
          ?.removeWhere((element) => element.price!.uzsPrice == 0);
      _allProductVariants = result.productVariants!;
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<ProductVariants> get allProductVariants => _allProductVariants;

  set allProductVariants(List<ProductVariants> value) {
    _allProductVariants = value;
    update();
  }
}
