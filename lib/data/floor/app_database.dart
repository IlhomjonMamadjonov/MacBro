import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao/product_dao.dart';
import 'entity/products.dart';

part 'app_database.g.dart'; // G. FILE

@Database(version: 1, entities: [Products])
abstract class AppDatabase extends FloorDatabase {
  ProductDao get productDao;

  static late AppDatabase instance;

  static Future<void> init() async {
    instance =
        await $FloorAppDatabase.databaseBuilder('macbro_database.db').build();
  }
}
