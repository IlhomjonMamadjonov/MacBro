// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sample_app_getx/base/base_functions.dart';
// import 'package:sample_app_getx/core/custom_widgets/bouncing/custom_bouncing_widget.dart';
// import 'package:sample_app_getx/core/paints/icon_logo_painter.dart';
// import 'package:sample_app_getx/core/theme/app_colors.dart';
// import 'package:sample_app_getx/core/theme/app_text_style.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sample_app_getx/data/data_source/local_source.dart';
// import 'package:sample_app_getx/data/floor/entity/products.dart';

// class FavoriteItem extends StatefulWidget {
//   FavoriteItem(
//       {Key? key,
//       required this.ls,
//       required this.index2,
//       this.onTap,
//       required this.check})
//       : super(key: key);

//   final List<Products>? ls;
//   final int index2;
//   bool check;
//   final Function()? onTap;

//   @override
//   State<FavoriteItem> createState() => _FavoriteItemState();
// }

// class _FavoriteItemState extends State<FavoriteItem>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   bool _showPrice = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//       lowerBound: 0.0,
//       upperBound: 0.1,
//     )..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = (Get.width - 36) / 2;

//     return CustomBouncingWidget(
//       animationController: _controller,
//       scaleFactor: 0.6,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: width,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(12)),
//               color: AppColors.white,
//             ),
//             height: width * 0.9,
//             child: StreamBuilder<List<Products>>(
//               stream: LocalSource.getInstance().getAllBasketProducts(),
//               builder: (context, snapshot) {
//                 return Container(
//                   height: width * 130 / 170,
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(12)),
//                   ),
//                   child: Stack(
//                     children: [
//                       ///product image
//                       Positioned.fill(
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 0),
//                           child: Hero(
//                             tag: '',
//                             child: ClipRRect(
//                               borderRadius: const BorderRadius.only(
//                                 topLeft: Radius.circular(12),
//                                 topRight: Radius.circular(12),
//                               ),
//                               child: CachedNetworkImage(
//                                 fit: BoxFit.contain,
//                                 errorWidget: (_, url, l) => const Center(
//                                   child: CustomPaint(
//                                     painter: IconLogoPainter(
//                                       color: AppColors.black,
//                                     ),
//                                     size: Size(80, 80),
//                                   ),
//                                 ),
//                                 placeholder: (_, e) => const Center(
//                                   child: CupertinoActivityIndicator(),
//                                 ),
//                                 imageUrl: widget.ls![widget.index2].image,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),

//                       Positioned.fill(
//                         child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             onTap: () =>
//                                 {} /*Get.toNamed(Routes.PRODUCT_DETAIL,
//                   arguments: widget.product)*/
//                             ,
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 8.0,
//                         right: 8.0,
//                         child: InkWell(
//                           onTap: () {
//                             setState(() {
//                               widget.check == false
//                                   ? () {}
//                                   : widget.check = !widget.check;
//                             });
//                           },
//                           child: CircleAvatar(
//                             radius: 12,
//                             backgroundColor: Colors.grey.withOpacity(0.2),
//                             child: SvgPicture.asset(
//                               "assets/svg/ic_like.svg",
//                               color: widget.check == true
//                                   ? Colors.red
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),

//           // /product name
//           Expanded(
//             child: Text(
//               widget.ls![widget.index2].name,
//               style: AppTextStyles.productTitle,
//               maxLines: 2,
//               textAlign: TextAlign.center,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//           Expanded(
//             child: Text(
//               "${BaseFunctions.moneyFormat(double.parse(widget.ls![widget.index2].price))} ${'sum'.tr}",
//               style: AppTextStyles.productCoast,
//               maxLines: 2,
//               textAlign: TextAlign.start,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
