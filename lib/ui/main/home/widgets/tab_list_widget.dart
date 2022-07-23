// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sample_app_getx/controller/main/home/home_controller.dart';
// import 'package:sample_app_getx/core/theme/app_colors.dart';
// import 'package:sample_app_getx/core/theme/app_text_style.dart';

// class TabListWidget extends StatelessWidget {
//   const TabListWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 32,
//       child: GetBuilder<HomeController>(
//         builder: (controller) => ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: controller.categories.length,
//           padding: const EdgeInsets.symmetric(horizontal: 12),
//           itemBuilder: (context, index) {
//             var category = controller.categories[index];
//             return Padding(
//               padding: const EdgeInsets.only(right: 8),
//               child: RawMaterialButton(
//                 onPressed: () => controller.changeIsCheckedCategory(index),
//                 elevation: 0,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 8,
//                 ),
//                 fillColor:
//                     category.isChecked ? AppColors.assets : AppColors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 focusElevation: 0,
//                 highlightElevation: 0,
//                 child: Center(
//                   child: Text(
//                     controller.categories[index].name ?? '',
//                     style: AppTextStyles.tabBarItemTitle.copyWith(
//                       color: category.isChecked
//                           ? AppColors.white
//                           : AppColors.black,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
