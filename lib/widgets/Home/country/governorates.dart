import 'package:alrehila/models/Home/country.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../link_api.dart';
import '../../../controller/home/country.dart';

class GovernorateSection extends GetView<CountryControllerImp> {
  const GovernorateSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.37,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: controller.governoratesData.length,
              (BuildContext context, int index) {
                return Governorate(
                  GovernoratesModel.fromJson(
                    controller.governoratesData[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Governorate extends GetView<CountryControllerImp> {
  final GovernoratesModel governoratesModel;
  const Governorate(this.governoratesModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.gotoGovernorate(
              governoratesModel.name,
              governoratesModel.nameAr,
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.img}/${governoratesModel.img}",
                  height: MediaQuery.of(context).size.width * 0.70,
                ),
              ),
              Positioned(
                bottom: 20,
                left: Get.locale!.languageCode == 'en' ? 0 : null,
                right: Get.locale!.languageCode == 'en' ? null : 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(
                        20,
                      ),
                      bottomRight: Radius.circular(
                        20,
                      ),
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        translateDatabase(
                          governoratesModel.nameAr,
                          governoratesModel.name,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "Explore services".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
