import 'package:alrehila/controller/home/country/governorate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../tools/class/handling_data_view.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../tools/translation/database.dart';

const _key = Key('governorateKey');

class Governorate extends StatefulWidget {
  const Governorate({super.key});

  @override
  State<Governorate> createState() => _GovernorateState();
}

class _GovernorateState extends State<Governorate> {
  final governorate = Get.arguments['governorate'];
  final governorateAR = Get.arguments['governorate_ar'];
  final controller = Get.put(GovernorateControllerImp());
  @override
  Widget build(BuildContext context) {
    Get.put(GovernorateControllerImp());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          translateDatabase(
            "$governorateAR",
            "$governorate",
          ),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.mode_of_travel_sharp),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.getData(governorate),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: GetBuilder<GovernorateControllerImp>(
                builder: (controller) {
                  if (controller.governorateData.isNotEmpty &&
                      (controller.governorateData[0]['beaches'] == 1 ||
                          controller.governorateData[0]['hotels'] == 1 ||
                          controller.governorateData[0]['places'] == 1 ||
                          controller.governorateData[0]['restaurants'] == 1)) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: AppColor.primary,
                                width: 1.5,
                              ),
                            ),
                            child: NavigationBar(
                              destinations: [
                                if (controller.governorateData.isNotEmpty &&
                                    controller.governorateData[0]['beaches'] ==
                                        1)
                                  AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    switchInCurve: Curves.bounceIn,
                                    switchOutCurve: Curves.bounceOut,
                                    key: const ValueKey('beaches'),
                                    child: NavigationDestination(
                                      icon: const Icon(Icons.beach_access),
                                      label: 'Beaches'.tr,
                                    ),
                                  ),
                                if (controller.governorateData.isNotEmpty &&
                                    controller.governorateData[0]['hotels'] ==
                                        1)
                                  AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    switchInCurve: Curves.bounceIn,
                                    switchOutCurve: Curves.bounceOut,
                                    key: const ValueKey('hotels'),
                                    child: NavigationDestination(
                                      icon: const Icon(Icons.hotel),
                                      label: 'Hotels'.tr,
                                    ),
                                  ),
                                if (controller.governorateData.isNotEmpty &&
                                    controller.governorateData[0]['places'] ==
                                        1)
                                  AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    switchInCurve: Curves.bounceIn,
                                    switchOutCurve: Curves.bounceOut,
                                    key: const ValueKey('places'),
                                    child: NavigationDestination(
                                      icon: const Icon(Icons.history_edu),
                                      label: 'Sights'.tr,
                                    ),
                                  ),
                                if (controller.governorateData.isNotEmpty &&
                                    controller.governorateData[0]
                                            ['restaurants'] ==
                                        1)
                                  AnimatedSwitcher(
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    switchInCurve: Curves.bounceIn,
                                    switchOutCurve: Curves.bounceOut,
                                    key: const ValueKey('restaurants'),
                                    child: NavigationDestination(
                                      icon: const Icon(Icons.restaurant),
                                      label: 'Restaurants'.tr,
                                    ),
                                  ),
                              ],
                              selectedIndex: controller.index,
                              onDestinationSelected: (i) => setState(
                                () => this.controller.index = i,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: controller.data[controller.index],
                          ),
                        ],
                      ),
                    );
                  }
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Container(),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
