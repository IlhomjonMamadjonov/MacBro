import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_utils.dart';

extension ExtendedText on Widget {
  edgeAllContainer(double number) {
    return Container(
      padding: EdgeInsets.all(number),
      margin: EdgeInsets.all(number),
      decoration: const BoxDecoration(
        borderRadius: AppUtils.kBorderRadius8,
        color: AppColors.white,
      ),
      child: this,
    );
  }

  edgeAllMarginContainer(double number) {
    return Container(
      padding: EdgeInsets.all(number),
      margin: EdgeInsets.all(number),
      decoration: const BoxDecoration(
        borderRadius: AppUtils.kBorderRadius8,
        color: AppColors.white,
      ),
      child: this,
    );
  }

  edgeALlPaddingContainer(double number) {
    return Container(
      padding: EdgeInsets.all(number),
      margin: EdgeInsets.all(number),
      decoration: const BoxDecoration(
        borderRadius: AppUtils.kBorderRadius8,
        color: AppColors.white,
      ),
      child: this,
    );
  }
}
