import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/search/products_search_response.dart';
import 'package:sample_app_getx/data/repository/home/home_repository.dart';
import 'package:get/get.dart';
import '../../../data/data_source/local_source.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;
  String lang = LocalSource.getInstance().getLocale();

  HomeController({
    required this.repository,
  }) : assert(repository != null);

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<Products> _featuredProducts = [];
  late TabController tabController;
  int activeIndex = 0;

  @override
  void onInit() {
    tabController = TabController(length: 1, vsync: this);
    super.onInit();
  }

  @override
  void onReady() async {
    load();
    super.onReady();
  }

  Future<void> load() async {
    setLoading(true);
    lang = LocalSource.getInstance().getLocale();
    await getBanners();
    await getCategory();
    await getFeaturedProducts();
    setLoading(false);
  }

  void updateActiveIndex(int index) {
    activeIndex = index;
    update();
  }

  /// BANNERS
  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners(
        lang: lang, shipperId: Constants.shipperId);
    setLoading(false);
    if (result is BannersResponse) {
      result.banners
          .removeWhere((element) => element.type.toString() != "image");
      _banners = result.banners;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  /// FEATURED PRODUCTS (NEWS)
  Future<void> getFeaturedProducts() async {
    setLoading(true);
    final result = await repository?.getFeaturedProducts(lang: lang);
    setLoading(false);
    if (result is ProductsResponse) {
      _featuredProducts = result.featuredList?.products ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  /// CATEGORY
  Future<void> getCategory() async {
    setLoading(true);
    final result = await repository?.getCategoryWithProducts(lang: lang);
    setLoading(false);
    if (result is CategoryResponse) {
      _categories = result.categories ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  /// SEARCH PRODUCT
  Future<List<Products>> searchProduct(String? search) async {
    setLoading(true);
    final result = await repository?.getSearchProducts(search: search!);
    setLoading(false);
    if (result is ProductsResponsee) {
      return result.products;
    } else {
      Get.snackbar('error'.tr, result.toString());
      return [];
    }
  }

  List<Banners> get banners => _banners;

  List<Products> get featuredProducts => _featuredProducts;

  List<Categories> get categories => _categories;
}
