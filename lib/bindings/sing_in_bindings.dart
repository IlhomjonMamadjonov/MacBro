import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/auth/sing_in_controller.dart';
import 'package:sample_app_getx/controller/main/main_controller.dart';
import 'package:sample_app_getx/data/repository/auth/auth_repository.dart';

class SingInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut<SingInController>(
      () => SingInController(
        authRepository: AuthRepository(),
      ),
      fenix: true,
    );
  }
}
