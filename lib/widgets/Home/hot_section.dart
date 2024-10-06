import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../link_api.dart';
import '../../tools/class/handling_data_view.dart';
import '../../controller/data/countries.dart';
import '../../models/Home/governorate/beaches.dart';
import '../../models/Home/governorate/hotels.dart';
import '../../models/Home/governorate/restaurants.dart';
import '../../models/Home/governorate/places.dart';
import '../customs/custom_loading_shimmer.dart';
import '../heros/beach_hero.dart';
import '../heros/hotels_hero.dart';
import '../heros/places_hero.dart';
import '../heros/restaurant_hero.dart';

const double cardHeightFactor = 0.20;
const double cardWidthFactor = 0.40;
const double textFieldHeight = 0.50;
const double spacing = 15.0;

class HotRestaurants extends GetView<CountryDataControllerImp> {
  const HotRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotSection(
      context,
      title: "Hot Restaurants :".tr,
      itemCount: controller.restaurants.length,
      itemBuilder: (index) {
        final restaurant =
            RestaurantsModel.fromJson(controller.restaurants[index]);
        return HotRestaurantCard(restaurant);
      },
    );
  }
}

class HotPlaces extends GetView<CountryDataControllerImp> {
  const HotPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotSection(
      context,
      title: "Hot Sights :".tr,
      itemCount: controller.places.length,
      itemBuilder: (index) {
        final place = PlacesModel.fromJson(controller.places[index]);
        return HotPlaceCard(place);
      },
    );
  }
}

class HotHotels extends GetView<CountryDataControllerImp> {
  const HotHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotSection(
      context,
      title: "Hot Hotels :".tr,
      itemCount: controller.hotels.length,
      itemBuilder: (index) {
        final hotel = HotelsModel.fromJson(controller.hotels[index]);
        return HotHotelCard(hotel);
      },
    );
  }
}

class HotBeaches extends GetView<CountryDataControllerImp> {
  const HotBeaches({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotSection(
      context,
      title: "Hot Beaches :".tr,
      itemCount: controller.beaches.length,
      itemBuilder: (index) {
        final beach = BeachesModel.fromJson(controller.beaches[index]);
        return HotBeachCard(beach);
      },
    );
  }
}

Widget _buildHotSection(
  BuildContext context, {
  required String title,
  required int itemCount,
  required Widget Function(int) itemBuilder,
}) {
  return Column(
    children: [
      Row(
        children: [
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 21,
            ),
          ),
        ],
      ),
      const SizedBox(height: 13),
      SizedBox(
        height: MediaQuery.of(context).size.height * cardHeightFactor,
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: GetBuilder<CountryDataControllerImp>(
                builder: (controller) => HandlingDataView(
                  height: MediaQuery.of(context).size.width * cardWidthFactor,
                  width:
                      MediaQuery.of(context).size.width * cardWidthFactor * 1.5,
                  statusRequest: controller.statusRequest,
                  widget: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: itemCount,
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                right: spacing,
                              ),
                              child: itemBuilder(index),
                            );
                          },
                        ),
                      ),
                    ],
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

class HotRestaurantCard extends StatelessWidget {
  final RestaurantsModel restaurant;
  const HotRestaurantCard(this.restaurant, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotCard(
      context,
      imageUrl: "${AppLink.img}/${restaurant.img}",
      name: translateDatabase(restaurant.nameAr, restaurant.name),
      heroPage: () => RestaurantsHero(
        cityName:
            translateDatabase(restaurant.governorateAr, restaurant.governorate),
        info:
            translateDatabase(restaurant.descriptionAr, restaurant.description),
        name: translateDatabase(restaurant.nameAr, restaurant.name),
        image: restaurant.img!,
        location: restaurant.location!,
        isFavorite: restaurant.favorite == 1,
        id: restaurant.id.toString(),
      ),
    );
  }
}

class HotPlaceCard extends StatelessWidget {
  final PlacesModel place;
  const HotPlaceCard(this.place, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotCard(
      context,
      imageUrl: "${AppLink.img}/${place.img}",
      name: translateDatabase(place.nameAr, place.name),
      heroPage: () => PlacesHero(
        cityName: translateDatabase(place.governorateAr, place.governorate),
        info: translateDatabase(place.descriptionAr, place.description),
        name: translateDatabase(place.nameAr, place.name),
        image: place.img!,
        location: place.location!,
        isFavorite: place.favorite == 1,
        id: place.id.toString(),
      ),
    );
  }
}

class HotHotelCard extends StatelessWidget {
  final HotelsModel hotel;
  const HotHotelCard(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotCard(
      context,
      imageUrl: "${AppLink.img}/${hotel.img}",
      name: translateDatabase(hotel.nameAr, hotel.name),
      heroPage: () => HotelsHero(
        cityName: translateDatabase(hotel.governorateAr, hotel.governorate),
        info: translateDatabase(hotel.descriptionAr, hotel.description),
        name: translateDatabase(hotel.nameAr, hotel.name),
        image: hotel.img!,
        location: hotel.location!,
        average: hotel.average!,
        isFavorite: hotel.favorite == 1,
        id: hotel.id.toString(),
      ),
    );
  }
}

class HotBeachCard extends StatelessWidget {
  final BeachesModel beach;
  const HotBeachCard(this.beach, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildHotCard(
      context,
      imageUrl: "${AppLink.img}/${beach.img}",
      name: translateDatabase(beach.nameAr, beach.name),
      heroPage: () => BeachesHero(
        cityName: translateDatabase(beach.governorateAr, beach.governorate),
        info: translateDatabase(beach.descriptionAr, beach.description),
        name: translateDatabase(beach.nameAr, beach.name),
        image: beach.img!,
        location: beach.location!,
        isFavorite: beach.favorite == 1,
        id: beach.id.toString(),
      ),
    );
  }
}

Widget _buildHotCard(
  BuildContext context, {
  required String imageUrl,
  required String name,
  required Widget Function() heroPage,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => heroPage(),
        ),
      );
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            height: MediaQuery.of(context).size.width * cardWidthFactor,
            placeholder: (context, url) => BuildShimmer(
              height: MediaQuery.of(context).size.width * cardWidthFactor,
            ),
            errorWidget: (context, url, error) => BuildErrorWidget(
              height: MediaQuery.of(context).size.width * cardWidthFactor,
            ),
          ),
        ),
        _buildCardOverlay(name),
      ],
    ),
  );
}

Widget _buildCardOverlay(String name) {
  return Positioned(
    bottom: 20,
    left: Get.locale!.languageCode == 'en' ? 0 : null,
    right: Get.locale!.languageCode == 'en' ? null : 0,
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "More details".tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    ),
  );
}
