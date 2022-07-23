import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/core/custom_widgets/flappy_searchbar/flappy_search_bar.dart';
import 'package:sample_app_getx/core/custom_widgets/loading_widgets/modal_progress_hud.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:sample_app_getx/core/theme/app_text_style.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/ui/main/home/widgets/banner_widget.dart';
import 'package:sample_app_getx/ui/main/home/detail_page/category_detail_pages/widgets/category_lists.dart';
import 'package:sample_app_getx/ui/main/home/widgets/loading_widget.dart';
import 'package:sample_app_getx/ui/main/home/widgets/product_list_widget.dart';
import 'package:sample_app_getx/ui/main/home/widgets/search_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SearchBar<Products>(
          title: 'home'.tr,
          titleStyle: AppTextStyles.appTitleSearch,
          onError: (error) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/png/ic_empty.png'),
                Text('Not_found'.tr, style: AppTextStyles.searchNotFound)
              ],
            ),
          ),
          hintText: 'search'.tr,
          hintStyle: AppTextStyles.searchItem.copyWith(
            color: AppColors.baseText50,
          ),
          textStyle: AppTextStyles.searchItem,
          searchBarPadding: const EdgeInsets.all(12),
          cancellationWidget: Text(
            'cancel'.tr,
            maxLines: 1,
            style: AppTextStyles.searchItem,
            textAlign: TextAlign.center,
          ),
          icon: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SvgPicture.asset('assets/svg/ic_search.svg'),
          ),
          placeHolder: GetBuilder<HomeController>(
            builder: (controller) {
              return ModalProgressHUD(
                inAsyncCall: controller.isLoading,
                child: Material(
                  color: AppColors.background,
                  child: Column(
                    children: [
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (_, index) => const BannerWidget(),
                                childCount: 1,
                              ),
                            ),

                            const ProductListWidget(),
                            const CategoryLists(),
                          ],
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          onItemFound: (product, index) => SearchItem(
            product: product,
            onTap: () async {
              // Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
            },
          ),
          onSearch: controller.searchProduct,
          listPadding: const EdgeInsets.all(12),
          loader: const LoadingWidget(),
        ),
      ),
    );
  }
}
