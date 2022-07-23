  class ProductsResponse {
  FeaturedList? featuredList;

  ProductsResponse({this.featuredList});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    featuredList = json['featured_list'] != null
        ? FeaturedList.fromJson(json['featured_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (featuredList != null) {
      data['featured_list'] = featuredList!.toJson();
    }
    return data;
  }
}

class FeaturedList {
  String? id;
  String? title;
  String? slug;
  List<Products>? products;
  String? order;
  String? createdAt;
  String? lang;
  bool? active;
  String? description;

  FeaturedList(
      {this.id,
      this.title,
      this.slug,
      this.products,
      this.order,
      this.createdAt,
      this.lang,
      this.active,
      this.description});

  FeaturedList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    order = json['order'];
    createdAt = json['created_at'];
    lang = json['lang'];
    active = json['active'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['order'] = order;
    data['created_at'] = createdAt;
    data['lang'] = lang;
    data['active'] = active;
    data['description'] = description;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? slug;
  String? previewText;
  bool? active;
  String? image;
  String? code;
  String? order;
  int? cheapestPrice;
  InStock? inStock;

  Products(
      {this.id,
      this.name,
      this.slug,
      this.previewText,
      this.active,
      this.image,
      this.code,
      this.order,
      this.cheapestPrice,
      this.inStock});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    previewText = json['preview_text'];
    active = json['active'];
    image = json['image'];
    code = json['code'];
    order = json['order'];
    cheapestPrice = json['cheapest_price'];
    inStock =
        json['inStock'] != null ? InStock.fromJson(json['inStock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['preview_text'] = previewText;
    data['active'] = active;
    data['image'] = image;
    data['code'] = code;
    data['order'] = order;
    data['cheapest_price'] = cheapestPrice;
    if (inStock != null) {
      data['inStock'] = inStock!.toJson();
    }
    return data;
  }
}

class InStock {
  bool? samarkand;
  bool? tashkentCity;

  InStock({this.samarkand, this.tashkentCity});

  InStock.fromJson(Map<String, dynamic> json) {
    samarkand = json['samarkand'];
    tashkentCity = json['tashkent_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['samarkand'] = samarkand;
    data['tashkent_city'] = tashkentCity;
    return data;
  }
}
