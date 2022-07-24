class ResponseProductResponse {
  List<ProductVariants>? productVariants;
  String? count;

  ResponseProductResponse({this.productVariants, this.count});

  ResponseProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['product_variants'] != null) {
      productVariants = <ProductVariants>[];
      json['product_variants'].forEach((v) {
        productVariants!.add(ProductVariants.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productVariants != null) {
      data['product_variants'] =
          productVariants!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class ProductVariants {
  String? id;
  String? name;
  String? slug;
  bool? active;
  Price? price;
  String? image;
  String? order;
  String? code;
  int? cheapestPrice;

  ProductVariants(
      {this.id,
        this.name,
        this.slug,
        this.active,
        this.price,
        this.image,
        this.order,
        this.code,
        this.cheapestPrice});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    image = json['image'];
    order = json['order'];
    code = json['code'];
    cheapestPrice = json['cheapest_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['active'] = active;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['image'] = image;
    data['order'] = order;
    data['code'] = code;
    data['cheapest_price'] = cheapestPrice;
    return data;
  }
}

class Price {
  int? price;
  int? oldPrice;
  int? uzsPrice;
  int? secondPrice;
  int? secondUzsPrice;

  Price(
      {this.price,
        this.oldPrice,
        this.uzsPrice,
        this.secondPrice,
        this.secondUzsPrice});

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    oldPrice = json['old_price'];
    uzsPrice = json['uzs_price'];
    secondPrice = json['second_price'];
    secondUzsPrice = json['second_uzs_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['uzs_price'] = uzsPrice;
    data['second_price'] = secondPrice;
    data['second_uzs_price'] = secondUzsPrice;
    return data;
  }
}