import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  static const shipperId = !kDebugMode
      ? 'd4b1658f-3271-4973-8591-98a82939a664'
      : 'e2d30f35-3d1e-4363-8113-9c81fdb2a762';
  static const baseUrl = 'https://api.client.macbro.uz/v1/';
  static const authUrl = 'https://api.auth.macbro.uz/v1/';
  static const androidPlatformID = "6bd7c2e3-d35e-47df-93ce-ed54ed53f95f";
  static const platformId = "7d4a4c38-dd84-4902-b744-0488b80a4c03";
  static const clientTypeId = "5a3818a9-90f0-44e9-a053-3be0ba1e2c07";
  static const roleId = "a1ca1301-4da9-424d-a9e2-578ae6dcde07";
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
