// import 'package:alrehila/tools/translation/database.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../link_api.dart';
// import '../../tools/class/handling_data_view.dart';
// import '../../controller/data/countries.dart';
// import '../../models/Home/governorate/restaurants.dart';
// import '../customs/custom_loading_shimmer.dart';
// import '../heros/restaurant_hero.dart';

// class HotRestaurants extends GetView<CountryDataControllerImp> {
//   const HotRestaurants({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             const SizedBox(
//               width: 12,
//             ),
//             Text(
//               "Hot Restaurants :".tr,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 21,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 13,
//         ),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.20,
//           child: Row(
//             children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               Expanded(
//                 child: GetBuilder<CountryDataControllerImp>(
//                   builder: (controller) => HandlingDataView(
//                     height: MediaQuery.of(context).size.width * 0.40,
//                     width: MediaQuery.of(context).size.width * 0.60,
//                     statusRequest: controller.statusRequest,
//                     widget: CustomScrollView(
//                       scrollDirection: Axis.horizontal,
//                       slivers: [
//                         SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             childCount: controller.restaurants.length,
//                             (BuildContext context, int index) {
//                               return Hotrestaurants(
//                                 RestaurantsModel.fromJson(
//                                   controller.restaurants[index],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Hotrestaurants extends GetView<CountryDataControllerImp> {
//   final RestaurantsModel restaurantsModel;
//   const Hotrestaurants(this.restaurantsModel, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => RestaurantsHero(
//                   cityName: translateDatabase(
//                     restaurantsModel.governorateAr,
//                     restaurantsModel.governorate,
//                   ),
//                   info: translateDatabase(
//                     restaurantsModel.descriptionAr,
//                     restaurantsModel.description,
//                   ),
//                   name: translateDatabase(
//                     restaurantsModel.nameAr,
//                     restaurantsModel.name,
//                   ),
//                   image: restaurantsModel.img!,
//                   location: restaurantsModel.location!,
//                   isFavorite: restaurantsModel.favorite == 1 ? true : false,
//                   id: restaurantsModel.id.toString(),
//                 ),
//               ),
//             );
//           },
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(
//                   20,
//                 ),
//                 child: CachedNetworkImage(
//                   imageUrl: "${AppLink.img}/${restaurantsModel.img}",
//                   height: MediaQuery.of(context).size.width * 0.40,
//                   placeholder: (context, url) => BuildShimmer(
//                     height: MediaQuery.of(context).size.width * 0.40,
//                   ),
//                   errorWidget: (context, url, error) => BuildErrorWidget(
//                     height: MediaQuery.of(context).size.width * 0.40,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 20,
//                 left: Get.locale!.languageCode == 'en' ? 0 : null,
//                 right: Get.locale!.languageCode == 'en' ? null : 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(
//                         15,
//                       ),
//                       bottomRight: Radius.circular(
//                         15,
//                       ),
//                     ),
//                     color: Colors.black.withOpacity(0.5),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         translateDatabase(
//                           restaurantsModel.nameAr,
//                           restaurantsModel.name,
//                         ),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w800,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                       Text(
//                         "More details".tr,
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w800,
//                         ),
//                         textAlign: TextAlign.start,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(
//           width: 15,
//         ),
//       ],
//     );
//   }
// }
