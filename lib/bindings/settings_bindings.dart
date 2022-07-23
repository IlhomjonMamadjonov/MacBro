import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/settings_controller.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
