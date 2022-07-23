import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';

import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/floor/entity/products.dart' as t;
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/ui/main/home/widgets/product_item.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SampleAppBar(
          title: "favourite".tr,
        ),
        body: StreamBuilder<List<t.Products>>(
          stream: LocalSource.getInstance().getAllBasketProducts(),
          builder: (_, snapshot) {
            var ls = snapshot.data;
            return ls!.isEmpty
                ? Center(
                    child: Padding(
                      padding: AppUtils.kAllPadding32,
                      child: Image.asset("assets/png/ic_empty.png"),
                    ),
                  )
                : SafeArea(
                    child: Flexible(
                      child: GridView.count(
                        crossAxisCount: 2,
                        physics: const ClampingScrollPhysics(),
                        padding: const EdgeInsets.all(12),
                        shrinkWrap: true,
                        addAutomaticKeepAlives: false,
                        cacheExtent: 160,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.85,
                        mainAxisSpacing: 12,
                        children: List.generate(
                          ls.length,
                          (i) {
                            return ProductItem(
                              product: Products(
                                id: ls[i].id,
                                name: ls[i].name,
                                image: ls[i].image,
                                cheapestPrice: int.tryParse(ls[i].price),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
          },
        ));
  }
}
