import 'package:alrehila/screens/Booking/booking.dart';
import 'package:alrehila/screens/saved/saved.dart';
import 'package:alrehila/screens/settings/settings.dart';
import 'package:alrehila/tools/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../tools/functions/alert_exit_app.dart';
import 'home_body.dart';

class BottomBar extends StatefulWidget {
  final int initialPageIndex;

  const BottomBar({super.key, this.initialPageIndex = 0});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPageIndex = 0;
  Services services = Get.find();
  late PageController pageController;

  @override
  void initState() {
    currentPageIndex = widget.initialPageIndex;
    pageController = PageController(initialPage: currentPageIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> pages = [
    const HomeBody(),
    const Saved(),
    Booking(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return alertExitApp();
      },
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: pages,
          onPageChanged: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPageIndex,
          onTap: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
            );
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.explore_rounded),
              title: Text("Discover".tr),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: Text("Favorite".tr),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.work_outline_rounded),
              title: Text("Booking".tr),
              selectedColor: Colors.blue,
            ),
            services.sharedPreferences.getInt("signin") == 1 ||
                    services.sharedPreferences.getInt("signin") == 2 ||
                    services.sharedPreferences.getInt("signin") == 3
                ? SalomonBottomBarItem(
                    icon: const Icon(Icons.person),
                    title: Text("Profile".tr),
                    selectedColor: Colors.blue,
                  )
                : SalomonBottomBarItem(
                    icon: const Icon(Icons.login_rounded),
                    title: Text("Sign in".tr),
                    selectedColor: Colors.blue,
                  ),
          ],
        ),
      ),
    );
  }
}
