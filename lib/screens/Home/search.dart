import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/search/search_lists.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<SearchLists> countries = [
    //Egypt
     SearchLists(
      name: 'Egypt'.tr,
    ),
     SearchLists(
      name: 'Alexandria'.tr,
    ),
     SearchLists(
      name: 'Cairo'.tr,
    ),
     SearchLists(
      name: 'Luxor and Aswan'.tr,
    ),

    //Saudi Arabia

     SearchLists(
      name: 'Saudi Arabia'.tr,
    ),
     SearchLists(
      name: 'Riyadh'.tr,
    ),
     SearchLists(
      name: 'Jeddah'.tr,
    ),

    //Qatar

     SearchLists(
      name: 'Qatar'.tr,
    ),
     SearchLists(
      name: 'Doha'.tr,
    ),

    //UAE

     SearchLists(
      name: 'UAE'.tr,
    ),
     SearchLists(
      name: 'Dubai'.tr,
    ),
     SearchLists(
      name: 'Abu Dhabi'.tr,
    ),
  ];

  late List<SearchLists> display = List.from(countries);

  void updateList(String value) {
    setState(
      () {
        display = countries
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "Search".tr,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: AppColor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (country) => updateList(country),
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: display.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(display[index].name),
                  onTap: () {
                    //Egypt

                    // if (display[index].name == "Egypt") {
                    //   Get.toNamed(AppRoute.EgyptCities);
                    // }
                    // if (display[index].name == "Alexandria") {
                    //   Get.toNamed(AppRoute.Alexandria);
                    // }
                    // if (display[index].name == "Cairo") {
                    //   Get.toNamed(AppRoute.Cairo);
                    // }
                    // if (display[index].name == "Luxor And Aswan") {
                    //   Get.toNamed(AppRoute.LuxorAswan);
                    // }

                    // //KSA

                    // if (display[index].name == "Saudi Arabia") {
                    //   Get.toNamed(AppRoute.SaudiCities);
                    // }

                    // if (display[index].name == "Jeddah") {
                    //   Get.toNamed(AppRoute.Jeddah);
                    // }

                    // if (display[index].name == "Riyadh") {
                    //   Get.toNamed(AppRoute.Riyadh);
                    // }

                    // //Qatar

                    // if (display[index].name == "Qatar") {
                    //   Get.toNamed(AppRoute.QatarCities);
                    // }

                    // if (display[index].name == "Doha") {
                    //   Get.toNamed(AppRoute.Doha);
                    // }

                    // // UAE

                    // if (display[index].name == "UAE") {
                    //   Get.toNamed(AppRoute.UAECities);
                    // }

                    // if (display[index].name == "Dubai") {
                    //   Get.toNamed(AppRoute.Dubai);
                    // }

                    // if (display[index].name == "Abu Dhabi") {
                    //   Get.toNamed(AppRoute.Abudhabi);
                    // }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
