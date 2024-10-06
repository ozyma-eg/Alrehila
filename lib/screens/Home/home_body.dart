import '../../tools/functions/alert_exit_app.dart';
import '../../controller/settings/settings.dart';
import '../../../tools/design/color_panel.dart';
import '../../widgets/Home/home_countries.dart';
import '../../../tools/services/services.dart';
import '../../controller/data/countries.dart';
import '../../../tools/routes/app_route.dart';
import 'package:flutter/material.dart';
import '../../controller/saved.dart';
import 'package:get/get.dart';

import '../../widgets/Home/hot_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final CountryDataControllerImp controller =
      Get.put(CountryDataControllerImp());
  final Services services = Get.find();
  bool showEndIndicator = false;
  final ScrollController scrollController = ScrollController();
  bool scrollingUp = false;
  double previousScrollOffset = 0;

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<SettingControllerImp>()) {
      Get.put(SettingControllerImp());
    }
    if (!Get.isRegistered<SavedControllerImp>()) {
      Get.put(SavedControllerImp());
    }

    return WillPopScope(
      onWillPop: alertExitApp,
      child: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: handleScrollNotification,
          child: RefreshIndicator(
            edgeOffset: 75,
            onRefresh: () => controller.getData(),
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                appBar(),
                bodyContent(),
                endOfPageIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool handleScrollNotification(ScrollNotification scrollNotification) {
    if (scrollNotification.metrics.extentAfter == 0 &&
        scrollNotification.metrics.pixels != 0) {
      if (scrollNotification is ScrollUpdateNotification) {
        if (!scrollingUp &&
            previousScrollOffset < scrollNotification.metrics.pixels) {
          showEndOfPageIndicator();
        }
      }
    } else if (showEndIndicator) {
      setState(() {
        showEndIndicator = false;
        scrollingUp = false;
      });
    }
    previousScrollOffset = scrollNotification.metrics.pixels;
    return true;
  }

  SliverAppBar appBar() {
    return SliverAppBar(
      pinned: false,
      backgroundColor: AppColor.primary,
      iconTheme: const IconThemeData(color: AppColor.white),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => Get.toNamed(AppRoute.search),
        ),
      ],
      title: Text(
        'Alrehila'.tr,
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

  SliverList bodyContent() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const SizedBox(height: 6),
          const HomeCountries(),
          const DividerSection(),
          const HotHotels(),
          const DividerSection(),
          const HotBeaches(),
          const DividerSection(),
          const HotPlaces(),
          const DividerSection(),
          const HotRestaurants(),
        ],
      ),
    );
  }

  SliverToBoxAdapter endOfPageIndicator() {
    return SliverToBoxAdapter(
      child: AnimatedOpacity(
        opacity: showEndIndicator ? 1.0 : 0.2,
        duration: const Duration(milliseconds: 100),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDivider(),
              Text(
                "END OF PAGE".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              _buildDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(18.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: AppColor.primary, spreadRadius: 4, blurRadius: 5),
            BoxShadow(color: AppColor.primary, spreadRadius: -4, blurRadius: 5),
          ],
        ),
        child: Divider(height: 1, color: AppColor.primary),
      ),
    );
  }

  void showEndOfPageIndicator() {
    if (!showEndIndicator) {
      setState(() {
        showEndIndicator = true;
        scrollingUp = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        if (!scrollingUp) return;
        scrollController.animateTo(
          scrollController.offset - 50,
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOut,
        );
        scrollingUp = true;
      });
    }
  }
}

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Divider(height: 36, color: AppColor.primary),
    );
  }
}
