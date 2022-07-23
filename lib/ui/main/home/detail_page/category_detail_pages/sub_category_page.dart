import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/home/home_controller.dart';
import 'package:sample_app_getx/ui/main/home/detail_page/category_detail_pages/widgets/category_detail.dart';
import '../../../../../data/models/categories/category_response.dart';

class SubCategoryPage extends GetView<HomeController> {
  const SubCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    List<Children>? subCategoryList = data[0] ?? [];
    String name = data[1] ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12),
          itemBuilder: (context, index) {
            return ItemSubCategoryWidget(
              id: subCategoryList![index].id,
              name: subCategoryList[index].name,
              image: subCategoryList[index].image,
            );
          },
          itemCount: subCategoryList?.length,
        ),
      ),
    );
  }
}
