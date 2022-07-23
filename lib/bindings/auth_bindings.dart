import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/auth/auth_controller.dart';

class AuthBindigns extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
