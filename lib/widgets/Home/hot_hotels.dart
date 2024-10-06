// import 'package:alrehila/tools/translation/database.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../link_api.dart';
// import '../../tools/class/handling_data_view.dart';
// import '../../controller/data/countries.dart';
// import '../../models/Home/governorate/hotels.dart';
// import '../customs/custom_loading_shimmer.dart';
// import '../heros/hotels_hero.dart';

// class HotHotels extends GetView<CountryDataControllerImp> {
//   const HotHotels({super.key});

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
//               "Hot Hotels :".tr,
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
//                             childCount: controller.hotels.length,
//                             (BuildContext context, int index) {
//                               return Hothotels(
//                                 HotelsModel.fromJson(
//                                   controller.hotels[index],
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

// class Hothotels extends GetView<CountryDataControllerImp> {
//   final HotelsModel hotelsModel;
//   const Hothotels(this.hotelsModel, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => HotelsHero(
//                   cityName: translateDatabase(
//                     hotelsModel.governorateAr,
//                     hotelsModel.governorate,
//                   ),
//                   info: translateDatabase(
//                     hotelsModel.descriptionAr,
//                     hotelsModel.description,
//                   ),
//                   name: translateDatabase(
//                     hotelsModel.nameAr,
//                     hotelsModel.name,
//                   ),
//                   image: hotelsModel.img!,
//                   location: hotelsModel.location!,
//                   average: hotelsModel.average!,
//                   isFavorite: hotelsModel.favorite == 1 ? true : false,
//                   id: hotelsModel.id.toString(),
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
//                   imageUrl: "${AppLink.img}/${hotelsModel.img}",
//                   height: MediaQuery.of(context).size.width * 0.40,
//                   width: MediaQuery.of(context).size.width * 0.60,
//                   placeholder: (context, url) => BuildShimmer(
//                     height: MediaQuery.of(context).size.width * 0.40,
//                     width: MediaQuery.of(context).size.width * 0.60,
//                   ),
//                   errorWidget: (context, url, error) => BuildErrorWidget(
//                     height: MediaQuery.of(context).size.width * 0.40,
//                     width: MediaQuery.of(context).size.width * 0.60,
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
//                           hotelsModel.nameAr,
//                           hotelsModel.name,
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
