import 'package:alrehila/widgets/heros/beach_hero.dart';
import 'package:alrehila/widgets/heros/places_hero.dart';
import 'package:alrehila/widgets/heros/restaurant_hero.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../link_api.dart';
import '../../tools/design/color_panel.dart';
import '../../controller/saved.dart';
import '../../models/Home/favorite.dart';
import '../heros/hotels_hero.dart';

class FavoriteSection extends GetView<SavedControllerImp> {
  const FavoriteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: GetBuilder<SavedControllerImp>(
              builder: (controller) => CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.data.length,
                      (BuildContext context, int i) {
                        return Data(
                          favoriteDataModel: FavoriteDataModel.fromJson(
                            controller.data[i],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Data extends StatelessWidget {
  final FavoriteDataModel favoriteDataModel;
  const Data({super.key, required this.favoriteDataModel});

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
                tag:
                    '${favoriteDataModel.id}_${favoriteDataModel.name}_${favoriteDataModel.type}',
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.img}${favoriteDataModel.img}',
                  width: 80,
                ),
              ),
            ),
            title: Text(
              translateDatabase(
                favoriteDataModel.nameAr,
                favoriteDataModel.name,
              ),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${favoriteDataModel.governorate} ${favoriteDataModel.type}',
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                favoriteDataModel.favorite == 1
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favoriteDataModel.favorite == 1
                    ? AppColor.red
                    : AppColor.white,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    if (favoriteDataModel.type == 'beach') {
                      return BeachesHero(
                        cityName: "${translateDatabase(
                          favoriteDataModel.governorateAr,
                          favoriteDataModel.governorate,
                        )}",
                        info: translateDatabase(favoriteDataModel.descriptionAr,
                            favoriteDataModel.description),
                        name: translateDatabase(
                            favoriteDataModel.nameAr, favoriteDataModel.name),
                        image: favoriteDataModel.img!,
                        location: favoriteDataModel.location!,
                        isFavorite:
                            favoriteDataModel.favorite == 1 ? true : false,
                        id: favoriteDataModel.id.toString(),
                      );
                    }
                    if (favoriteDataModel.type == 'hotel') {
                      return HotelsHero(
                        cityName: "${translateDatabase(
                          favoriteDataModel.governorateAr,
                          favoriteDataModel.governorate,
                        )}",
                        info: translateDatabase(favoriteDataModel.descriptionAr,
                            favoriteDataModel.description),
                        name: translateDatabase(
                            favoriteDataModel.nameAr, favoriteDataModel.name),
                        image: favoriteDataModel.img!,
                        location: favoriteDataModel.location!,
                        average: favoriteDataModel.average!,
                        isFavorite:
                            favoriteDataModel.favorite == 1 ? true : false,
                        id: favoriteDataModel.id.toString(),
                      );
                    }
                    if (favoriteDataModel.type == 'place') {
                      return PlacesHero(
                        cityName: "${translateDatabase(
                          favoriteDataModel.governorateAr,
                          favoriteDataModel.governorate,
                        )}",
                        info: translateDatabase(favoriteDataModel.descriptionAr,
                            favoriteDataModel.description),
                        name: translateDatabase(
                            favoriteDataModel.nameAr, favoriteDataModel.name),
                        image: favoriteDataModel.img!,
                        location: favoriteDataModel.location!,
                        isFavorite:
                            favoriteDataModel.favorite == 1 ? true : false,
                        id: favoriteDataModel.id.toString(),
                      );
                    }
                    if (favoriteDataModel.type == 'restaurant') {
                      return RestaurantsHero(
                        cityName: "${translateDatabase(
                          favoriteDataModel.governorateAr,
                          favoriteDataModel.governorate,
                        )}",
                        info: translateDatabase(favoriteDataModel.descriptionAr,
                            favoriteDataModel.description),
                        name: translateDatabase(
                            favoriteDataModel.nameAr, favoriteDataModel.name),
                        image: favoriteDataModel.img!,
                        location: favoriteDataModel.location!,
                        isFavorite:
                            favoriteDataModel.favorite == 1 ? true : false,
                        id: favoriteDataModel.id.toString(),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
