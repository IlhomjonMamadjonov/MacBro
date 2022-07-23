class CategoryResponse {
  List<Categories>? categories;
  String? count;

  CategoryResponse({this.categories, this.count});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  List<Children>? children;
  String? image;
  String? tradeInImage;
  bool? wide;

  Categories(
      {this.id,
        this.name,
        this.slug,
        this.active,
        this.description,
        this.order,
        this.children,
        this.image,
        this.tradeInImage,
        this.wide});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    image = json['image'];
    tradeInImage = json['trade_in_image'];
    wide = json['wide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['active'] = active;
    data['description'] = description;
    data['order'] = order;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['trade_in_image'] = tradeInImage;
    data['wide'] = wide;
    return data;
  }
}

class Children {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  String? image;
  String? tradeInImage;
  dynamic children;
  String? createdAt;
  String? updatedAt;

  Children(
      {this.id,
        this.name,
        this.slug,
        this.active,
        this.description,
        this.order,
        this.image,
        this.tradeInImage,
        this.children,
        this.createdAt,
        this.updatedAt});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    image = json['image'];
    tradeInImage = json['trade_in_image'];
    children = json['children'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['active'] = active;
    data['description'] = description;
    data['order'] = order;
    data['image'] = image;
    data['trade_in_image'] = tradeInImage;
    data['children'] = children;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}