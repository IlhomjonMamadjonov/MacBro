import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:sample_app_getx/base/base_repository.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/response_product_variant.dart';
import 'package:sample_app_getx/data/models/search/products_search_response.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/provider/response_handler.dart';
import 'package:sample_app_getx/data/provider/server_error.dart';

import '../../models/limited_product_response.dart';

class HomeRepository extends BaseRepository {
  ApiClient apiClient;

  HomeRepository({
    required this.apiClient,
  });

  /// BANNERS
  Future<ResponseHandler<BannersResponse>> _fetchBanners(
      {required String shipperId,
      required int page,
      required int limit}) async {
    BannersResponse response;
    try {
      response = await apiClient.getBanners(limit);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners({required String shipperId}) async {
    final response =
        await _fetchBanners(shipperId: shipperId, limit: 100, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  /// FEATURED PRODUCTS (NEWS)
  Future<ResponseHandler<ProductsResponse>> _fetchFeaturedProducts() async {
    ProductsResponse response;
    try {
      response = await apiClient.getFeaturedProducts();
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getFeaturedProducts() async {
    final response = await _fetchFeaturedProducts();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  /// CATEGORIES
  Future<ResponseHandler<CategoryResponse?>>
      _fetchCategoryWithProducts() async {
    CategoryResponse response;
    try {
      response = await apiClient.getCategoryWithProduct("10", "uz");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategoryWithProducts() async {
    final response = await _fetchCategoryWithProducts();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  /// SEARCH PRODUCTS
  Future<ResponseHandler<ProductsResponsee>> _fetchSearchProducts(
      {required String search}) async {
    ProductsResponsee response;
    try {
      response = await apiClient.getProductSearch(search);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getSearchProducts({required String search}) async {
    final response = await _fetchSearchProducts(search: search);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  /// PRODUCT VARIANTS (ALL PRODUCTS IN CATEGORY BY ID)
  Future<ResponseHandler<ProductVariants>> _fetchProductVariants(
      {required bool active,
      required String categoryId,
      required String lang,
      required int limit,
      required int page}) async {
    ProductVariants response;
    try {
      response = (await apiClient.getProductVariants(
          active, categoryId, lang, limit, page)) as ProductVariants;
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductVariants({
    required String categoryId,
  }) async {
    final response = await _fetchProductVariants(
        active: true, categoryId: categoryId, lang: 'ru', limit: 1000, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  /// LIMITED PRODUCTS (ALL PRODUCTS IN CATEGORY BY ID)
  Future<ResponseHandler<ResponseLimitedProducts>> _fetchLimitedProducts(
      {required String categoryId,
      required String lang,
      required String limit,
      required String page}) async {
    ResponseLimitedProducts response;
    try {
      response =
          (await apiClient.getLimitedProducts(categoryId, lang, limit, page));
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getLimitedProducts({
    required String categoryId,
    required String lang,
    required String limit,
    required String page
  }) async {
    final response = await _fetchLimitedProducts(
        categoryId: categoryId, lang: lang, limit: limit, page: page);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }
}
