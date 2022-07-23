// import 'package:get/get.dart';
// import 'package:sample_app_getx/base/base_controller.dart';
// import 'package:sample_app_getx/data/data_source/local_source.dart';
// import 'package:sample_app_getx/data/models/userme/userme_request.dart';
// import 'package:sample_app_getx/data/models/userme/userme_response.dart';
// import 'package:sample_app_getx/data/repository/auth/auth_repository.dart';

// class UserMeController extends BaseController
//     with GetSingleTickerProviderStateMixin {
//   final AuthRepository? authRepository;
//   UserMeController({
//     required this.authRepository,
//   }) : assert(authRepository != null);
//   var localSource = LocalSource.getInstance();

//   UserMeResponse data = UserMeResponse();

//   // Future<String?> userMe() async {
//   //   final result = await authRepository!.userMe(
//   //     authorization: UserMeRequest(
//   //       authorization: localSource.getAccessToken(),
//   //     ),
//   //   );
//   //   if (result is UserMeResponse) {
//   //     data = result;
//   //     return result.toString();
//   //   } else {
//   //     Get.snackbar('error'.tr, result.toString());
//   //   }
//   //   return null;
//   // }
// }
