import 'package:alrehila/models/Home/governorate/restaurants.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../controller/home/country/governorate.dart';
import '../../../heros/restaurant_hero.dart';

class RestaurantsSection extends GetView<GovernorateControllerImp> {
  const RestaurantsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GetBuilder<GovernorateControllerImp>(
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.restaurantsData.length,
                (BuildContext context, int i) {
                  return Restaurant(
                    restaurantsModel: RestaurantsModel.fromJson(
                      controller.restaurantsData[i],
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

class Restaurant extends StatelessWidget {
  final RestaurantsModel restaurantsModel;
  const Restaurant({super.key, required this.restaurantsModel});

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
                tag: "N_${restaurantsModel.name}",
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.img}${restaurantsModel.img}',
                  width: 80,
                ),
              ),
            ),
            title: Text(
              translateDatabase(restaurantsModel.nameAr, restaurantsModel.name),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${Get.locale!.languageCode != 'en' ? 'Restaurant'.tr : ''} ${translateDatabase(restaurantsModel.governorateAr, restaurantsModel.governorate)} ${Get.locale!.languageCode == 'en' ? 'Restaurant'.tr : ''}',
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RestaurantsHero(
                    cityName:
                        "${translateDatabase(restaurantsModel.governorateAr, restaurantsModel.governorate)}",
                    name: translateDatabase(
                        restaurantsModel.nameAr, restaurantsModel.name),
                    info: translateDatabase(restaurantsModel.descriptionAr,
                        restaurantsModel.description),
                    image: restaurantsModel.img!,
                    location: restaurantsModel.location!,
                    isFavorite: restaurantsModel.favorite == 1 ? true : false,
                    id: restaurantsModel.id.toString(),
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
