import 'dart:convert';

BannersResponse bannersResponseFromJson(String str) =>
    BannersResponse.fromJson(json.decode(str));

String bannersResponseToJson(BannersResponse data) =>
    json.encode(data.toJson());

class BannersResponse {
  BannersResponse({
    required this.banners,
    required this.count,
  });

  List<Banners> banners;
  String count;

  factory BannersResponse.fromJson(Map<String, dynamic> json) =>
      BannersResponse(
        banners:
            List<Banners>.from(json["banners"].map((x) => Banners.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "count": count,
      };
}

class Banners {
  Banners({
    this.active,
    this.buttonTitle,
    this.description,
    this.id,
    this.image,
    this.lang,
    this.position,
    this.price,
    this.slug,
    this.title,
    this.type,
    this.url,
  });

  bool? active;
  String? buttonTitle;
  String? description;
  String? id;
  String? image;
  String? lang;
  Position? position;
  int? price;
  String? slug;
  String? title;
  String? type;
  String? url;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        active: json["active"],
        buttonTitle: json["button_title"],
        description: json["description"],
        id: json["id"],
        image: json["image"],
        lang: json["lang"],
        position: Position.fromJson(json["position"]),
        price: json["price"],
        slug: json["slug"],
        title: json["title"],
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "button_title": buttonTitle,
        "description": description,
        "id": id,
        "image": image,
        "lang": lang,
        "position": position!.toJson(),
        "price": price,
        "slug": slug,
        "title": title,
        "type": type,
        "url": url,
      };
}

class Position {
  Position({
    this.active,
    this.createdAt,
    this.description,
    this.id,
    this.size,
    this.slug,
    this.title,
    this.updatedAt,
  });

  bool? active;
  String? createdAt;
  String? description;
  String? id;
  String? size;
  String? slug;
  String? title;
  String? updatedAt;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        active: json["active"],
        createdAt: json["created_at"],
        description: json["description"],
        id: json["id"],
        size: json["size"],
        slug: json["slug"],
        title: json["title"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "active": active,
        "created_at": createdAt,
        "description": description,
        "id": id,
        "size": size,
        "slug": slug,
        "title": title,
        "updated_at": updatedAt,
      };
}

// class BannersResponse {
//   List<Banners> banners = [];
//   String? count;

//   BannersResponse({this.banners = const [], this.count});

//   BannersResponse.fromJson(Map<String, dynamic> json) {
//     banners = <Banners>[];
//     if (json['banners'] != null) {
//       json['banners'].forEach((v) {
//         banners.add(new Banners.fromJson(v));
//       });
//     } else {
//       banners = [];
//     }
//     count = json['count'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['banners'] = this.banners.map((v) => v.toJson()).toList();
//     data['count'] = this.count;
//     return data;
//   }
// }

// class Banners {
//   String? id;
//   Title? title;
//   String? position;
//   String? image;
//   String? url;
//   bool? active;
//   String? createdAt;
//   String? updatedAt;
//   String? shipperId;

//   Banners({
//     this.id,
//     this.title,
//     this.position,
//     this.image,
//     this.url,
//     this.active,
//     this.createdAt,
//     this.updatedAt,
//     this.shipperId,
//   });

//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'] != null ? new Title.fromJson(json['title']) : null;
//     position = json['position'];
//     image = json['image'];
//     url = json['url'];
//     active = json['active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     shipperId = json['shipper_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.title != null) {
//       data['title'] = this.title!.toJson();
//     }
//     data['position'] = this.position;
//     data['image'] = this.image;
//     data['url'] = this.url;
//     data['active'] = this.active;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['shipper_id'] = this.shipperId;
//     return data;
//   }
// }

// class Title {
//   String? uz;
//   String? ru;
//   String? en;

//   Title({this.uz, this.ru, this.en});

//   Title.fromJson(Map<String, dynamic> json) {
//     uz = json['uz'];
//     ru = json['ru'];
//     en = json['en'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['uz'] = this.uz;
//     data['ru'] = this.ru;
//     data['en'] = this.en;
//     return data;
//   }
// }
