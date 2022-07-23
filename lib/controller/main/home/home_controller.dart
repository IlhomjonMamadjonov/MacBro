import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/response_product_variant.dart';
import 'package:sample_app_getx/data/models/search/products_search_response.dart';
import 'package:sample_app_getx/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

import '../../../data/models/limited_product_response.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;

  HomeController({
    required this.repository,
  }) : assert(repository != null);

  List<Banners> _banners = [];
  List<Categories> _categories = [];
  List<Products> _featuredProducts = [];
  List<ProductVariants> _allProductVariants = [];
  List<Product> _limitedProducts = [];
  late TabController tabController;
  int activeIndex = 0;

  @override
  void onInit() {
    tabController = TabController(length: 1, vsync: this);
    super.onInit();
  }
  @override
  void onReady() async {
    setLoading(true);
    await getBanners();
    await getCategory();
    await getFeaturedProducts();
    setLoading(false);
    super.onReady();
  }


  void updateActiveIndex(int index) {
    activeIndex = index;
    update();
  }

  /// BANNERS
  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners(shipperId: Constants.shipperId);
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
    final result = await repository?.getFeaturedProducts();
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
    final result = await repository?.getCategoryWithProducts();
    setLoading(false);
    if (result is CategoryResponse) {
      _categories = result.categories ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
      setLoading(false);
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


  // PRODUCT VARIANTS (ALL PRODUCTS BY CATEGORY ID)
  Future<void> getProductVariants(String categoryId) async {
    setLoading(true);
    final result = await repository?.getProductVariants(categoryId: categoryId);
    result.removeWhere((element) => element.price!.uzsPrice == 0);
    setLoading(false);
    if (result != null) {
      _allProductVariants = result;
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }
  // LIMITED PRODUCTS (BY CATEGORY ID)
  Future<void> getLimitedProducts(String categoryId) async {
    setLoading(true);
    final result = await repository?.getLimitedProducts(
        categoryId: categoryId, lang: 'ru', limit: "10", page: "1");
    setLoading(false);
    if (result is ResponseLimitedProducts) {
      _limitedProducts = result.products!;
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  List<Banners> get banners => _banners;

  List<Products> get featuredProducts => _featuredProducts;

  List<Categories> get categories => _categories;

  List<ProductVariants> get allProductVariants => _allProductVariants;

  List<Product> get limitedProducts => _limitedProducts;


}
