import 'package:alrehila/tools/translation/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../tools/design/color_panel.dart';
import '../../tools/class/handling_data_view.dart';
import '../../widgets/Home/country/about.dart';
import '../../widgets/Home/country/events.dart';
import '../../widgets/Home/country/governorates.dart';
import '../../widgets/Home/country/store.dart';
import '../../controller/home/country.dart';

const _key = Key('countryKey');

class Country extends StatelessWidget {
  Country({super.key});
  final CountryControllerImp controller = Get.put(CountryControllerImp());
  final country = Get.arguments['country'];
  final countryAR = Get.arguments['country_ar'];

  @override
  Widget build(BuildContext context) {
    Get.put(CountryControllerImp());
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
                translateDatabase(
                    "${'Cities'.tr} $countryAR", "$country ${'Cities'.tr}"),
                style: const TextStyle(
                  fontSize: 25,
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
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Form(
                      key: _key,
                      child: SingleChildScrollView(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GetBuilder<CountryControllerImp>(
                              builder: (controller) {
                                return Column(
                                  children: [
                                    HandlingDataView(
                                      statusRequest: controller.statusRequest,
                                      widget: Column(
                                        children: [
                                          const GovernorateSection(),
                                          controller.countryData.isNotEmpty &&
                                                  controller.countryData[0]
                                                          ['about'] ==
                                                      1
                                              ? const Column(
                                                  children: [
                                                    SizedBox(height: 25),
                                                    AboutSection(),
                                                  ],
                                                )
                                              : Container(),
                                          controller.countryData.isNotEmpty &&
                                                  controller.countryData[0]
                                                          ['events'] ==
                                                      1
                                              ? const Column(
                                                  children: [
                                                    SizedBox(height: 25),
                                                    EventsSection(),
                                                  ],
                                                )
                                              : Container(),
                                          controller.countryData.isNotEmpty &&
                                                  controller.countryData[0]
                                                          ['store'] ==
                                                      1
                                              ? const Column(
                                                  children: [
                                                    SizedBox(height: 25),
                                                    StoreSection(),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
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
