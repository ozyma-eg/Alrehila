import 'package:alrehila/models/Home/governorate/places.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../controller/home/country/governorate.dart';
import '../../../heros/places_hero.dart';

class PlacesSection extends GetView<GovernorateControllerImp> {
  const PlacesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GetBuilder<GovernorateControllerImp>(
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.placesData.length,
                (BuildContext context, int i) {
                  return Places(
                    placesModel: PlacesModel.fromJson(
                      controller.placesData[i],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Places extends StatelessWidget {
  final PlacesModel placesModel;
  const Places({super.key, required this.placesModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColor.primary, width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: "N_${placesModel.name}",
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.img}${placesModel.img}',
                  width: 80,
                ),
              ),
            ),
            title: Text(
              translateDatabase(
                placesModel.nameAr,
                placesModel.name,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${Get.locale!.languageCode != 'en' ? 'Tourist Sight'.tr : ''} ${translateDatabase(placesModel.governorateAr, placesModel.governorate)} ${Get.locale!.languageCode == 'en' ? 'Tourist Sight'.tr : ''}',
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PlacesHero(
                    cityName:
                        "${translateDatabase(placesModel.governorateAr, placesModel.governorate)}",
                    info: translateDatabase(
                        placesModel.descriptionAr, placesModel.description),
                    name:
                        translateDatabase(placesModel.nameAr, placesModel.name),
                    image: placesModel.img!,
                    location: placesModel.location!,
                    isFavorite: placesModel.favorite == 1 ? true : false,
                    id: placesModel.id.toString(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
