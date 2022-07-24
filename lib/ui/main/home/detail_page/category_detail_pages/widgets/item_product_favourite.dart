import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../base/base_functions.dart';
import '../../../../../../core/theme/app_colors.dart';

class ItemProductFavouriteWidget extends StatelessWidget {
  final String? id;
  final String? name;
  final String? image;
  final int? price;

  const ItemProductFavouriteWidget({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 246,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 164,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: CachedNetworkImage(
                      imageUrl: image ??
                          'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                      placeholder: (context, url) => SizedBox(
                        width: 343,
                        height: 180,
                        child:SvgPicture.asset('assets/svg/ic_macbro.svg'),
                      ),
                      errorWidget: (_, __, ___) => SizedBox(
                        width: 343,
                        height: 180,
                        child: SvgPicture.asset('assets/svg/ic_macbro.svg'),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$name",
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                BaseFunctions.moneyFormatSymbol(price!),
                style: const TextStyle(
                  color: Color(0xFF007AFF),
                  letterSpacing: -0.2,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
