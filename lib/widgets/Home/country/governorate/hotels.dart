import 'package:alrehila/models/Home/governorate/hotels.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../controller/home/country/governorate.dart';
import '../../../heros/hotels_hero.dart';

class HotelsSection extends GetView<GovernorateControllerImp> {
  const HotelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: GetBuilder<GovernorateControllerImp>(
        builder: (controller) => CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: controller.hotelsData.length,
                  (BuildContext context, int i) {
                return Hotel(
                  hotelsModel: HotelsModel.fromJson(
                    controller.hotelsData[i],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Hotel extends StatelessWidget {
  final HotelsModel hotelsModel;
  const Hotel({super.key, required this.hotelsModel});

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
                tag: "N_${hotelsModel.name}",
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.img}${hotelsModel.img}',
                  width: 80,
                ),
              ),
            ),
            title: Text(
              translateDatabase(
                hotelsModel.nameAr,
                hotelsModel.name,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${Get.locale!.languageCode != 'en' ? 'Hotel'.tr : ''} ${translateDatabase(hotelsModel.governorateAr, hotelsModel.governorate)} ${Get.locale!.languageCode == 'en' ? 'Hotel'.tr : ''}',
            ),
            trailing: Text('${hotelsModel.average}\$'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HotelsHero(
                    cityName:
                        "${translateDatabase(hotelsModel.governorateAr, hotelsModel.governorate)}",
                    info: translateDatabase(
                        hotelsModel.descriptionAr, hotelsModel.description),
                    name:
                        translateDatabase(hotelsModel.nameAr, hotelsModel.name),
                    image: hotelsModel.img!,
                    location: hotelsModel.location!,
                    average: hotelsModel.average!,
                    isFavorite: hotelsModel.favorite == 1 ? true : false,
                    id: hotelsModel.id.toString(),
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
