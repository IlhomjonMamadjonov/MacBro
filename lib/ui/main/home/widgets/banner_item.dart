import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import '../../../../data/models/banners/banners_response.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({Key? key, this.banner}) : super(key: key);

  final Banners? banner;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 343,
      height: 180,
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color:  AppColors.white,
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: banner?.image ??
                'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
            imageBuilder: (context, imageProvider) => Container(
              width: 343,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: AppUtils.kBorderRadius8,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            errorWidget: (_, __, ___) => SizedBox(
              width: 343,
              height: 180,
              child: Image.asset('assets/png/img_3.png'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  banner?.title ?? '',
                  style: AppTextStyles.basketAppBarTitle,
                ),
                const SizedBox(
                  height: 70,
                ),
                Image.asset(
                  'assets/png/img_1.png',
                  height: 24,
                  width: 19.54,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
