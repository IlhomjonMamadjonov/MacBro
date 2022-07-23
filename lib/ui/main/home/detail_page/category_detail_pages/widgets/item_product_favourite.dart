import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../base/base_functions.dart';

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
              color: Colors.white,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: CachedNetworkImage(
                      imageUrl: image ??
                          'https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg',
                      imageBuilder: (context, imageProvider) => Container(
                        width: 343,
                        height: 180,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => SizedBox(
                        width: 343,
                        height: 180,
                        child: Image.asset('assets/png/macbro.png'),
                      ),
                      errorWidget: (_, __, ___) => SizedBox(
                        width: 343,
                        height: 180,
                        child: Image.asset('assets/png/macbro.png'),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: 8,
                //   right: 8,
                // child: LikeBtnWidget(
                //   id: id,
                //   name: name,
                //   image: image,
                //   price: price,
                // ),
                // ),
              ],
            ),
          ),
          SizedBox(
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
                BaseFunctions.moneyFormatSymbol(price!) + " сум",
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
