import 'package:get/get.dart';
import 'package:sample_app_getx/bindings/auth_bindings.dart';
import 'package:sample_app_getx/bindings/limited_products_binding.dart';
import 'package:sample_app_getx/bindings/main_bindings.dart';
import 'package:sample_app_getx/bindings/profile_bindings.dart';
import 'package:sample_app_getx/bindings/settings_bindings.dart';
import 'package:sample_app_getx/bindings/sing_in_bindings.dart';
import 'package:sample_app_getx/bindings/sms_bindings.dart';
import 'package:sample_app_getx/bindings/splash_bindings.dart';
import 'package:sample_app_getx/routes/app_routes.dart';
import 'package:sample_app_getx/ui/auth/auth_page.dart';
import 'package:sample_app_getx/ui/auth/sing_in/sign_in_page.dart';
import 'package:sample_app_getx/ui/auth/sing_in_password_confirm/singin_pass_confirm.dart';
import 'package:sample_app_getx/ui/internet_connection/internet_connection_page.dart';
import 'package:sample_app_getx/ui/main/main/main_page.dart';
import 'package:sample_app_getx/ui/main/profile/profile_page.dart';
import 'package:sample_app_getx/ui/main/profile/settings/settings_page.dart';
import 'package:sample_app_getx/ui/splash/splash_page.dart';

import '../bindings/all_products_bindings.dart';
import '../bindings/sub_category_bindings.dart';
import '../ui/main/home/detail_page/category_detail_pages/all_products_page.dart';
import '../ui/main/home/detail_page/category_detail_pages/limited_products_page.dart';
import '../ui/main/home/detail_page/category_detail_pages/sub_category_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.internetConnection,
      page: () => const InternetConnectionPage(),
    ),
    GetPage(
      name: Routes.singin,
      page: () => const SignInPage(),
      binding: SingInBindings(),
    ),
    GetPage(
      name: Routes.sms,
      page: () => SmsPage(),
      binding: SmsBindings(),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const RegistrationPage(),
      binding: AuthBindigns(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBindings(),
    ),
    GetPage(
        name: Routes.settings,
        page: () => const SettingsPage(),
        binding: SettingsBindings()),
    GetPage(
        name: Routes.subCategoryPage,
        page: () => const SubCategoryPage(),
        binding: SubCategoryBindings()),
    GetPage(
        name: Routes.limitedProductsPage,
        page: () => const LimitedProductsPage(),
        binding: LimitedProductsBinding()),
    GetPage(
        name: Routes.allProductsPage,
        page: () => const AllProductsPage(),
        binding: AllProductsBinding()),
  ];
}
