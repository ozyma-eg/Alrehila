import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/routes/app_route.dart';
import '../../../tools/services/services.dart';
import '../../screens/Home/bottombar.dart';
import '../../screens/onboarding_screen/static.dart';

abstract class OnBoadrdingContllorer extends GetxController {
  skip();
  next();
  onPageChanged(int pageNo);
}

class OnBoardingContllorerImp extends OnBoadrdingContllorer {
  PageController pageController = PageController(initialPage: 0);

  var currentPage = 0;

  @override
  onPageChanged(pageNo) {
    currentPage = pageNo;
    update();
  }

  Services services = Get.find();

  @override
  skip() {
    if (services.sharedPreferences.getInt('onboarding') == 1) {
      Get.offAll(
        const BottomBar(initialPageIndex: 3),
        transition: Transition.leftToRight,
      );
    } else {
      services.sharedPreferences.setInt("onboarding", 1);
      Get.offAllNamed(AppRoute.home);
    }
  }

  @override
  next() {
    currentPage++;
    if (currentPage <= onBoardingList.length - 1) {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
      update();
    } else if (currentPage > onBoardingList.length - 1) {
      if (services.sharedPreferences.getInt('onboarding') == 1) {
        Get.offAll(
          const BottomBar(initialPageIndex: 3),
          transition: Transition.leftToRight,
        );
      } else {
        services.sharedPreferences.setInt("onboarding", 1);
        Get.offAllNamed(AppRoute.home);
      }
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
