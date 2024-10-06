import 'package:alrehila/models/Home/governorate/beaches.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../controller/home/country/governorate.dart';
import '../../../heros/beach_hero.dart';

class BeachesSection extends GetView<GovernorateControllerImp> {
  const BeachesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GetBuilder<GovernorateControllerImp>(
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: controller.beachsData.length,
                (BuildContext context, int i) {
                  return Beache(
                    beachesModel:
                        BeachesModel.fromJson(controller.beachsData[i]),
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

class Beache extends StatelessWidget {
  final BeachesModel beachesModel;
  const Beache({super.key, required this.beachesModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColor.primary,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: "N_${beachesModel.name}",
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.img}${beachesModel.img}',
                  width: 80,
                ),
              ),
            ),
            title: Text(
              translateDatabase(beachesModel.nameAr, beachesModel.name),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${Get.locale!.languageCode != 'en' ? 'Beach'.tr : ''} ${translateDatabase(beachesModel.governorateAr, beachesModel.governorate)} ${Get.locale!.languageCode == 'en' ? 'Beach'.tr : ''}',
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BeachesHero(
                    cityName:
                        "${translateDatabase(beachesModel.governorateAr, beachesModel.governorate)}",
                    name: translateDatabase(
                        beachesModel.nameAr, beachesModel.name),
                    info: translateDatabase(
                        beachesModel.descriptionAr, beachesModel.description),
                    image: beachesModel.img!,
                    location: beachesModel.location!,
                    isFavorite: beachesModel.favorite == 1 ? true : false,
                    id: beachesModel.id.toString(),
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
