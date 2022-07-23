import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/models/customer/customer.dart';
import 'package:sample_app_getx/data/models/userme/userme_response.dart';
import 'package:sample_app_getx/data/repository/auth/auth_repository.dart';

class ProfileController extends BaseController {
  final AuthRepository authRepository = AuthRepository();
  final LocalSource localSource = LocalSource.getInstance();

  Future<bool> userMe(String accessToken, String refreshToken) async {
    final result = await authRepository.userMe(
      authorization: accessToken,
    );
    if (result is UserMeResponse) {
      await localSource.setCustomer(Customer(
        accessToken: accessToken,
        lastName: result.lastName,
        name: result.firstName,
        phone: result.phoneNumber,
        id: result.id,
        refreshToken: refreshToken,
      ));

      return true;
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
    return false;
  }
}
