import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/controller/main/my_orders/my_orders_controller.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';

class MyOrdersPage extends GetView<MyOrdersController> {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("basket".tr),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: AppUtils.kAllPadding32,
          child: Image.asset("assets/png/ic_empty.png"),
        ),
      ),
    );
  }
}
