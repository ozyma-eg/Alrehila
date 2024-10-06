import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../link_api.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/translation/database.dart';
import '../../../controller/home/country.dart';
import '../../../controller/data/countries.dart';

class EventsSection extends GetView<CountryDataControllerImp> {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CountryControllerImp>(
      builder: (controller) => Center(
        child: GestureDetector(
          onTap: () {
            // controller.gotoEvents(controller.country , controller.country_ar);
            controller.gotoEvents();
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
                      "${AppLink.img}/${controller.countryData[0]["events_img"]}",
                  width: MediaQuery.of(context).size.width * 0.95,
                ),
              ),
              Text(
                translateDatabase(
                    "${'Events'.tr} ${controller.countryData[0]["name_ar"]}",
                    "${controller.countryData[0]["name"]} ${'Events'.tr}"),
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
