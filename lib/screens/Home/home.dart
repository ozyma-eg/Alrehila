// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// import '../../../tools/design/color_panel.dart';
// import '../../../tools/functions/alert_exit_app.dart';
// import '../guide_list.dart';
// import '../Home/Home_body.dart';

// final navigationkey = GlobalKey<CurvedNavigationBarState>();
// final screens = [
//   HomeBody(),
//   const Guidelist(),
// ];

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvokedWithResult: ((didPop, resault) async {
//         final shouldExit = await alertExitApp();
//         if (shouldExit) {
//           return Future.value();
//         }
//         return Future.value();
//       }),
//       child: Scaffold(
//         body: screens[index],
//         extendBody: true,
//         bottomNavigationBar: CurvedNavigationBar(
//           items: [
//             CurvedNavigationBarItem(
//               child: const Icon(
//                 Icons.home,
//                 color: AppColor.white,
//               ),
//               labelStyle: const TextStyle(
//                 color: AppColor.white,
//                 fontSize: 12,
//               ),
//               label: 'Home'.tr,
//             ),
//             CurvedNavigationBarItem(
//               child: const CircleAvatar(
//                 backgroundImage: AssetImage(
//                   'assets/images/tourguide.png',
//                 ),
//               ),
//               labelStyle: const TextStyle(
//                 color: AppColor.white,
//                 fontSize: 12,
//               ),
//               label: 'Tour Guide'.tr,
//             ),
//           ],
//           backgroundColor: Colors.transparent,
//           height: 60,
//           color: AppColor.primary,
//           index: index,
//           onTap: (index) => setState(
//             () => this.index = index,
//           ),
//         ),
//       ),
//     );
//   }
// }
