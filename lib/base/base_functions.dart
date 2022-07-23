import 'dart:io';

import 'package:intl/intl.dart';
class BaseFunctions {
  BaseFunctions._();

  static String moneyFormat(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(splitter);
    return isNegative ? "-" + result : result;
  }

  static String moneyFormatSymbol(num number) {
    String splitter = " ";
    final isNegative = number.isNegative;
    number = number.abs();
    String result = "0";
    result = NumberFormat().format(number).split(",").join(splitter);
    return (isNegative ? "-" + result : result) + " sum";
  }

  static String getDefaultLocale() {
    final String defaultSystemLocale = Platform.localeName;
    switch (defaultSystemLocale.split("_").first) {
      case "ru":
        return "ru";
      case "en":
        return "en";
      case "uz":
        return "uz";
      default:
        return "ru";
    }
  }

  // static Future<void> refreshToken() async {
  //   var request = RefreshTokenRequest(
  //     refreshToken: LocalSource.getInstance().getRefreshToken(),
  //   );
  //   // final refreshTokenRepository = RefreshTokenRepository();
  //   final result = await refreshTokenRepository.refreshToken(request: request);
  //   if (result is RefreshTokenResponse) {
  //     LocalSource.getInstance().setRefreshedTokens(
  //       refreshToken: result.refreshToken,
  //       accessToken: result.accessToken,
  //     );
  //   }
  // }

// static String getStringByLanguage(Title value) {
//   var lang = GetStorage().read<String>('locale') ?? 'ru';
//   if (lang == 'ru') {
//     return value?.ru ?? '';
//   } else if (lang == 'en') {
//     return value?.en ?? '';
//   } else {
//     return value?.uz ?? '';
//   }
// }
}
