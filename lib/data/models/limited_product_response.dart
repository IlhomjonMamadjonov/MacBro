class ResponseLimitedProducts {
  ResponseLimitedProducts({
    this.products,
    this.count,});

  ResponseLimitedProducts.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
    count = json['count'];
  }
  List<Product>? products;
  String? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    return map;
  }

}

class Product {
  Product({
    this.id,
    this.name,
    this.slug,
    this.active,
    this.image,
    this.code,
    this.order,
    this.cheapestPrice,
    this.price,
    this.discount,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    image = json['image'];
    code = json['code'];
    order = json['order'];
    cheapestPrice = json['cheapest_price'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    discount = json['discount'];
  }
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? image;
  String? code;
  String? order;
  int? cheapestPrice;
  Price? price;
  int? discount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['active'] = active;
    map['image'] = image;
    map['code'] = code;
    map['order'] = order;
    map['cheapest_price'] = cheapestPrice;
    if (price != null) {
      map['price'] = price?.toJson();
    }
    map['discount'] = discount;
    return map;
  }

}

class Price {
  Price({
    this.price,
    this.oldPrice,
    this.uzsPrice,
    this.secondPrice,
    this.secondUzsPrice,});

  Price.fromJson(dynamic json) {
    price = json['price'];
    oldPrice = json['old_price'];
    uzsPrice = json['uzs_price'];
    secondPrice = json['second_price'];
    secondUzsPrice = json['second_uzs_price'];
  }
  int? price;
  int? oldPrice;
  int? uzsPrice;
  int? secondPrice;
  int? secondUzsPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['old_price'] = oldPrice;
    map['uzs_price'] = uzsPrice;
    map['second_price'] = secondPrice;
    map['second_uzs_price'] = secondUzsPrice;
    return map;
  }

}