import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../link_api.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/translation/database.dart';
import '../../../controller/home/country.dart';
import '../../../controller/data/countries.dart';

class StoreSection extends GetView<CountryDataControllerImp> {
  const StoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryControllerImp>(
      builder: (controller) => Center(
        child: GestureDetector(
          onTap: () {
            controller.gotoStore(controller.country, controller.countryAR);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "${AppLink.img}/${controller.countryData[0]["store_img"]}",
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
              Text(
                translateDatabase(
                    "${'Store'.tr} ${controller.countryData[0]["name_ar"]}",
                    "${controller.countryData[0]["name"]} ${'Store'.tr}"),
                style: const TextStyle(
                  color: AppColor.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
