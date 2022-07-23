import 'package:floor/floor.dart';

@entity
class Products {
  @primaryKey
  String id;
  String name;
  String image;
  String price;

  Products({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });
}
