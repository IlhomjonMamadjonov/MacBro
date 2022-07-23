import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/auth/sms_controller.dart';

class SmsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SmsController());
  }
}
