import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../link_api.dart';
import '../../tools/class/handling_data_view.dart';
import '../../tools/design/color_panel.dart';
import '../../tools/routes/app_route.dart';
import '../controller/data/freelancers.dart';

class Guidelist extends StatefulWidget {
  const Guidelist({super.key});

  @override
  State<Guidelist> createState() => _GuidelistState();
}

class _GuidelistState extends State<Guidelist> {
  @override
  Widget build(BuildContext context) {
    Get.put(GuideDataControllerImp());
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 60.0,
      ),
      child: Scaffold(
        // drawer: const DrawerScreen(),
        body: GetBuilder<GuideDataControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: CustomScrollView(
              slivers: [
                SliverAppBar(
                  iconTheme: const IconThemeData(
                    color: AppColor.white,
                  ),
                  backgroundColor: AppColor.primary,
                  title: Text(
                    'Tour Guides'.tr,
                    style: const TextStyle(
                      fontSize: 25,
                      color: AppColor.white,
                    ),
                  ),
                  floating: true,
                  centerTitle: true,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.guides.length,
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(
                          6.0,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 13,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          "${AppLink.img}/${controller.guides[index]["img"]}",
                                      width: 48,
                                      height: 48,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            // const Icon(Icons.person,),
                                            Text(
                                              'Name : '.tr,
                                            ),
                                            Text(
                                              '${controller.guides[index]["name"]}'
                                                  .tr,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            // const Icon(Icons.location_pin,),
                                            Text(
                                              'Location : '.tr,
                                            ),
                                            Text(
                                              '${controller.guides[index]["location"]}'
                                                  .tr,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                MaterialButton(
                                  onPressed: () {
                                    Get.toNamed(
                                      AppRoute.freelancersProfile,
                                      arguments: {
                                        "name": controller.guides[index]
                                            ["name"],
                                        "img": controller.guides[index]["img"],
                                        "language": controller.guides[index]
                                            ["language"],
                                        "age": controller.guides[index]["age"],
                                        "phone": controller.guides[index]
                                            ["phone"],
                                        "location": controller.guides[index]
                                            ["location"],
                                        "email": controller.guides[index]
                                            ["email"],
                                      },
                                    );
                                  },
                                  textColor: Colors.white,
                                  color: AppColor.primary,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        20.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    'View'.tr,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
