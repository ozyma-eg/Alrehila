import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../link_api.dart';
import '../../tools/class/handling_data_view.dart';
import '../../tools/translation/database.dart';
import '../../controller/data/countries.dart';
import '../../models/countries.dart';
import '../customs/custom_loading_shimmer.dart';

class HomeCountries extends StatelessWidget {
  const HomeCountries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            Text(
              "Countries :".tr,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.37,
          child: Row(
            children: [
              const SizedBox(
                width: 13,
              ),
              Expanded(
                child: GetBuilder<CountryDataControllerImp>(
                  builder: (controller) => RefreshIndicator(
                    onRefresh: () => controller.getData(),
                    child: HandlingDataView(
                      width: MediaQuery.of(context).size.width * 0.40,
                      height: MediaQuery.of(context).size.width * 0.70,
                      statusRequest: controller.statusRequest,
                      widget: CustomScrollView(
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              childCount: controller.countrys.length,
                              (BuildContext context, int index) {
                                return Countries(
                                  countriesModel: CountriesModel.fromJson(
                                    controller.countrys[index],
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Countries extends GetView<CountryDataControllerImp> {
  final CountriesModel countriesModel;
  const Countries({super.key, required this.countriesModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.gotoCountry(
              countriesModel.name,
              countriesModel.nameAr,
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
                  imageUrl: "${AppLink.img}/${countriesModel.img}",
                  height: MediaQuery.of(context).size.width * 0.70,
                  placeholder: (context, url) => BuildShimmer(
                    height: MediaQuery.of(context).size.width * 0.70,
                  ),
                  errorWidget: (context, url, error) => BuildErrorWidget(
                    height: MediaQuery.of(context).size.width * 0.70,
                  ),
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
                          countriesModel.nameAr!,
                          countriesModel.name!,
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
