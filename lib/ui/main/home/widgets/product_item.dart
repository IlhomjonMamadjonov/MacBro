import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_functions.dart';
import 'package:sample_app_getx/core/custom_widgets/bouncing/custom_bouncing_widget.dart';
import 'package:sample_app_getx/core/paints/icon_logo_painter.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/floor/entity/products.dart' as db;
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/ui/main/home/widgets/loading_widget.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({Key? key, this.product, this.onTap}) : super(key: key);

  final Products? product;
  final Function()? onTap;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final bool _showPrice = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final width = (Get.width - 50) / 2;
    return CustomBouncingWidget(
      animationController: _controller,
      scaleFactor: 0.6,
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius8,
        ),
        child: StreamBuilder<List<db.Products>>(
          stream: LocalSource.getInstance().getAllBasketProducts(),
          builder: (context, snapshot) {
            var isBasket = false;
            db.Products? basketProducts;
            if (snapshot.hasData) {
              for (var element in snapshot.data!) {
                debugPrint(isBasket.toString());
                if (element.id == (widget.product?.id ?? '')) {
                  isBasket = true;
                  basketProducts = element;
                  break;
                } else {
                  isBasket = false;
                }
              }
            }
            var localSource = LocalSource.getInstance();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 160.0,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius:AppUtils.kBorderRadius12),

                  child: Stack(
                    children: [
                      ///product image
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: Hero(
                            tag: widget.product?.slug ?? '',
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: CachedNetworkImage(
                                  fit: BoxFit.contain,
                                  errorWidget: (_, url, l) => const Center(
                                        child: CustomPaint(
                                          painter: IconLogoPainter(
                                            color: AppColors.black,
                                          ),
                                          size: Size(80, 80),
                                        ),
                                      ),
                                  placeholder: (_, e) => const LoadingWidget(),
                                  imageUrl: widget.product?.image ?? ''),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () {
                              // Get.toNamed(
                              //   Routes.assembly,
                              //   arguments: widget.product!.id,
                              // );
                            },
                          ),
                        ),
                      ),

                      ///show hide animation widget
                      Positioned.fill(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: basketProducts != null && _showPrice
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                    color: AppColors.black.withOpacity(0.4),
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [],
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),

                      //Like Icon
                      Positioned(
                        top: 8.0,
                        right: 8.0,
                        child: InkWell(
                          onTap: () async {
                            if (!isBasket) {
                              await localSource.insertProduct(
                                db.Products(
                                  id: widget.product?.id ?? '',
                                  name: widget.product?.name ?? '',
                                  image: widget.product?.image ?? '',
                                  price: widget.product?.cheapestPrice
                                          .toString() ??
                                      "",
                                ),
                              );
                            } else {
                              await localSource.removeProduct(
                                db.Products(
                                  id: widget.product?.id ?? '',
                                  name: widget.product?.name ?? '',
                                  image: widget.product?.image ?? '',
                                  price: widget.product?.cheapestPrice
                                          .toString() ??
                                      "",
                                ),
                              );
                            }
                          },
                          child: CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey.withOpacity(0.2),
                            child: SvgPicture.asset(
                              "assets/svg/ic_like.svg",
                              color: isBasket ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ///product name
                Padding(
                  padding: const EdgeInsets.only(left: 3.0, bottom: 5.0),
                  child: Text(
                    widget.product?.name ?? '',
                    style: AppTextStyles.productTitle,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      "${BaseFunctions.moneyFormat(double.parse(widget.product?.cheapestPrice.toString() ?? '0'))} ${'sum'.tr}",
                      style: AppTextStyles.productCoast,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
