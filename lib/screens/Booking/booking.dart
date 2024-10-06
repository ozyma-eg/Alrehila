import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/routes/app_route.dart';
import '../../../../tools/services/services.dart';
import '../../controller/booking/booking.dart';
import '../../tools/functions/alert_exit_app.dart';

class Booking extends StatelessWidget {
  Booking({super.key});

  final BookingControllerImp controller = Get.put(BookingControllerImp());
  final Services services = Get.find();

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(child: Text('Active'.tr)),
      Tab(child: Text('Past'.tr)),
      Tab(child: Text('Cancelled'.tr)),
    ];

    final screenHeight = MediaQuery.of(context).size.height;
    final adjustedHeight =
        (screenHeight < 600) ? screenHeight * 1.3 : screenHeight * 0.85;

    return WillPopScope(
      onWillPop: () {
        return alertExitApp();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            appBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: adjustedHeight,
                  child: DefaultTabController(
                    length: tabs.length,
                    child: Column(
                      children: [
                        tabBar(tabs),
                        tabBarView(),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar appBar() {
    return SliverAppBar(
      pinned: false,
      backgroundColor: AppColor.primary,
      iconTheme: const IconThemeData(color: AppColor.white),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Get.toNamed(AppRoute.search),
        ),
      ],
      title: Text(
        'Bookings'.tr,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
      ),
      floating: true,
      centerTitle: true,
    );
  }

  Widget tabBar(List<Tab> tabs) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TabBar(
        labelColor: AppColor.white,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primary,
        ),
        tabs: tabs,
        indicatorPadding: EdgeInsets.zero,
        labelPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
      ),
    );
  }

  Widget tabBarView() {
    return Expanded(
      child: TabBarView(
        children: [
          emptyState("No booking yet".tr,
              "Get started by creating an account or sign in".tr),
          emptyState("No past bookings".tr,
              "Get started by creating an account or sign in".tr),
          emptyState("No cancelled bookings".tr,
              "Get started by creating an account or sign in".tr),
        ],
      ),
    );
  }

  Widget emptyState(String title, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Image.asset(
              "assets/images/globe.png",
              height: 150,
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(fontSize: 28, fontFamily: "Nunito-Bold"),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              message,
              style: const TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6.5),
            ElevatedButton(
              onPressed: () {
                controller.goToSignin();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColor.primary,
              ),
              child: Text(
                "Sign In".tr,
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
