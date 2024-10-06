import 'package:alrehila/controller/home/country/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/services/services.dart';
import '../../../tools/translation/database.dart';
import '../../../widgets/Home/country/store/store.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final country = Get.arguments['country'];
  final countryAR = Get.arguments['country_ar'];
  StoreControllerImp controller = Get.put(StoreControllerImp());
  Services services = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(StoreControllerImp());
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: false,
              backgroundColor: AppColor.primary,
              iconTheme: const IconThemeData(
                color: AppColor.white,
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
              title: Text(
                translateDatabase(
                    "${'Store'.tr} $countryAR", "$country ${'Store'.tr}"),
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              ),
              floating: true,
              centerTitle: true,
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () => controller.getData(country),
          child: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: StoreWidget(),
          ),
        ),
      ),
    );
  }
}
