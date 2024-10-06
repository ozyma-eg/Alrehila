import 'package:alrehila/widgets/Home/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../tools/design/color_panel.dart';
import '../../controller/saved.dart';
import '../../tools/functions/alert_exit_app.dart';

class Saved extends StatefulWidget {
  const Saved({super.key});

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    SavedControllerImp controller = Get.put(SavedControllerImp());

    return WillPopScope(
      onWillPop: () {
        return alertExitApp();
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => controller.getData(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: AppColor.white),
                backgroundColor: AppColor.primary,
                title: Text(
                  'Favorite'.tr,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
                centerTitle: true,
                floating: true,
                pinned: false,
              ),
              if (controller.data.isEmpty)
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      LottieBuilder.asset(
                        "assets/lottie/Ticket.json",
                        height: 320,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              "Save what you love for later".tr,
                              style: const TextStyle(
                                fontSize: 28,
                                fontFamily: "Nunito-Bold",
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Create lists of favourite hotels".tr,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            MaterialButton(
                              onPressed: () {
                                controller.search();
                              },
                              color: AppColor.primary,
                              child: Text(
                                "Start searching".tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColor.white,
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                controller.createList();
                              },
                              child: Text(
                                "Create a list".tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.primary,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              if (controller.data.isNotEmpty)
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const FavoriteSection(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
