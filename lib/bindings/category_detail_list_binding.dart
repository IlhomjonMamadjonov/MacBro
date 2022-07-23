
import 'package:get/get.dart';

import '../controller/main/home/home_controller.dart';
import '../data/provider/api_client.dart';
import '../data/repository/home/home_repository.dart';

class CategoryDetailListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(repository: HomeRepository(apiClient: ApiClient.getInstance())),fenix: true);

  }
}