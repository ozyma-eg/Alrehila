import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_route.dart';
import '../services/services.dart';

class MiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  Services services = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (services.sharedPreferences.getInt("onboarding") == 1) {
      return const RouteSettings(
        name: AppRoute.home,
      );
    }
    return null;
  }
}
