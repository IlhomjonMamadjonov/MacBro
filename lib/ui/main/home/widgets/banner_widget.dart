import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:sample_app_getx/core/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../controller/main/home/home_controller.dart';
import 'banner_item.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({Key? key}) : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Visibility(
        visible: controller.banners.isNotEmpty,
        child: Stack(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: const Duration(seconds: 2),
                onPageChanged: (index, reason) =>
                    controller.updateActiveIndex(index),
              ),
              itemCount: controller.banners.length,
              itemBuilder: (context, index, realIndex) {
                var banner = controller.banners[index];
                return BannerItem(
                  banner: banner,
                );
              },
            ),
            Container(
              width: 375,
              height: 180,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedSmoothIndicator(
                    activeIndex: controller.activeIndex,
                    count: controller.banners.length,
                    effect: const ScrollingDotsEffect(
                        dotColor: AppColors.grey,
                        activeDotColor: AppColors.black,
                        dotHeight: 6,
                        dotWidth: 6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
