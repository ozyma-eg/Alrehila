import 'package:alrehila/widgets/Home/country/about/about.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/design/color_panel.dart';
import '../../../controller/home/country/about.dart';

class About extends StatelessWidget {
  About({super.key});
  final country = Get.arguments['country'];
  final countryAR = Get.arguments['country_ar'];
  final controller = Get.put(AboutControllerImp());

  @override
  Widget build(BuildContext context) {
    Get.put(AboutControllerImp());
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              iconTheme: const IconThemeData(
                color: AppColor.white,
              ),
              backgroundColor: AppColor.primary,
              title: Text(
                '${'About'.tr} ${translateDatabase(countryAR, country)}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: AppColor.white,
                ),
              ),
              centerTitle: true,
              floating: true,
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () => controller.getData(country),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SafeArea(
                      maintainBottomViewPadding: true,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: AboutWidget(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
