import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/profile/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
