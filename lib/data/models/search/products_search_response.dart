
import 'package:sample_app_getx/data/models/products/products_response.dart';

class ProductsResponsee {
  List<Products> products = [];

  String? count;

  ProductsResponsee({this.products = const [], this.count});

  ProductsResponsee.fromJson(Map<String, dynamic> json) {
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(Products.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['products'] = products.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}
