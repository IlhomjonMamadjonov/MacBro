import 'package:get_storage/get_storage.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/data/floor/app_database.dart';
import 'package:sample_app_getx/data/floor/dao/product_dao.dart';
import 'package:sample_app_getx/data/floor/entity/products.dart';
import 'package:sample_app_getx/data/keys/app_keys.dart';
import 'package:sample_app_getx/data/models/customer/customer.dart';

class LocalSource {
  final _localStorage = GetStorage();
  final ProductDao _productDao = AppDatabase.instance.productDao;

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  Stream<List<Products>> getAllBasketProducts() {
    return _productDao.getBasketProducts();
  }

  Future<void> insertProduct(Products product) async {
    await _productDao.insertProduct(product);
  }

  Future<void> removeProduct(Products product) async {
    await _productDao.removeProduct(product);
  }

  bool hasProfile() {
    return _localStorage.read<bool>(AppKeys.hasProfile) ?? false;
  }

  // remove all things
  Future<void> removeProfile() async {
    await _localStorage.remove(AppKeys.hasProfile);
    await _localStorage.remove(AppKeys.customerId);
    await _localStorage.remove(AppKeys.name);
    await _localStorage.remove(AppKeys.locale);
    await _localStorage.remove(AppKeys.phone);
    await _localStorage.remove(AppKeys.accessToken);
    await _localStorage.remove(AppKeys.refreshToken);
    await _localStorage.erase();
  }

  Future<void> setCustomer(Customer customer) async {
    await _localStorage.write(AppKeys.hasProfile, true);
    await _localStorage.write(AppKeys.customerId, customer.id);
    await _localStorage.write(AppKeys.name, customer.name);
    await _localStorage.write(AppKeys.phone, customer.phone);
    await _localStorage.write(AppKeys.lastName, customer.lastName);
    await _localStorage.write(AppKeys.accessToken, customer.accessToken);
    await _localStorage.write(AppKeys.refreshToken, customer.refreshToken);
  }

  Future<void> setAccessToken(String? customer) async {
    await _localStorage.write(AppKeys.accessToken, customer);
  }

  String getAccessToken() {
    return _localStorage.read<String>(AppKeys.accessToken) ?? '';
  }

  String getLocale() {
    return _localStorage.read<String>(AppKeys.locale) ??
        BaseFunctions.getDefaultLocale();
  }
  Future<void> setLocale(String languageCode) async {
    _localStorage.write(AppKeys.locale, languageCode);
  }
  Customer getCustomer() => Customer(
        id: _localStorage.read<String>(AppKeys.customerId) ?? '',
        name: _localStorage.read<String>(AppKeys.name) ?? '',
        phone: _localStorage.read<String>(AppKeys.phone) ?? '',
        lastName: _localStorage.read<String>(AppKeys.lastName) ?? '',
        accessToken: _localStorage.read<String>(AppKeys.accessToken) ?? '',
        refreshToken: _localStorage.read<String>(AppKeys.refreshToken) ?? '',
      );
}
