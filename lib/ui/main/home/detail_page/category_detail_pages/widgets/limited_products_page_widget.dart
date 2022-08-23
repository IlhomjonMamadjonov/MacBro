import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import '../../../../../../base/base_functions.dart';

class LimitedProductsPageWidget extends StatelessWidget {
  const LimitedProductsPageWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  final String? id;
  final String? name;
  final String? image;
  final int? price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: AppUtils.kBorderRadius8,
      child: Ink(
        width: 165.5,
        height: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 96,
              child: CachedNetworkImage(
                imageUrl: image ??
                    "https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg",
                placeholder: (ctx, url) => SizedBox(
                    width: 343,
                    height: 180,
                    child: SvgPicture.asset('assets/svg/ic_macbro.svg')),
                imageBuilder: (ctx, img) {
                  return Ink.image(
                    image: img,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "$name ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 17,
                      letterSpacing: -0.41,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              BaseFunctions.moneyFormatSymbol(price ?? 0),
              style: const TextStyle(
                color: Color(0xFF007AFF),
                letterSpacing: -0.24,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
