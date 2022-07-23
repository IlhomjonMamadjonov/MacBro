import 'package:get/route_manager.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

class MainController extends BaseController {
  BottomMenu _bottomMenu = BottomMenu.home;

  void setMenu(BottomMenu menu) {
    if (menu == BottomMenu.profile && !LocalSource.getInstance().hasProfile()) {
      Get.toNamed(Routes.singin);
    } else {
      _bottomMenu = menu;
      update();
    }
  }

  BottomMenu get bottomMenu => _bottomMenu;
}

enum BottomMenu { home, myOrders, favorite, profile }
