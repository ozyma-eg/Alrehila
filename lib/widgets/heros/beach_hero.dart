import 'package:alrehila/controller/heros/beach.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../link_api.dart';
import '../../main.dart';
import '../../tools/design/color_panel.dart';

class BeachesHero extends StatefulWidget {
  final String id;
  final String cityName;
  final String name;
  final String info;
  final String image;
  final String location;
  final bool isFavorite;

  const BeachesHero({
    super.key,
    required this.id,
    required this.cityName,
    required this.name,
    required this.info,
    required this.image,
    required this.location,
    required this.isFavorite,
  });

  @override
  State<BeachesHero> createState() => _BeachesHeroState();
}

class _BeachesHeroState extends State<BeachesHero> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  BeachHeroControllerImp controller = BeachHeroControllerImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
        backgroundColor: AppColor.primary,
        title: Text(
          widget.cityName.tr,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: "BT_${widget.name}_${widget.id}",
                    child: CachedNetworkImage(
                      imageUrl: '${AppLink.img}${widget.image}',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.name.tr,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        toggleFavorite();
                        controller.beachId = widget.id;
                        isFavorite
                            ? controller.addFavorite()
                            : controller.removeFavorite();
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? AppColor.red
                            : MyApp.themeNotifier.value == ThemeMode.light
                                ? AppColor.black
                                : AppColor.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColor.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.info.tr,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColor.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_pin,
                          ),
                          InkWell(
                            child: Text(
                              'Location'.tr,
                              style: const TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            onTap: () => launchUrl(
                              Uri.parse(widget.location),
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
        ),
      ),
    );
  }
}
