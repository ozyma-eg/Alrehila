import 'package:alrehila/models/Home/about/about.dart';
import 'package:alrehila/tools/design/color_panel.dart';
import 'package:alrehila/tools/translation/database.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../controller/home/country/about.dart';

class AboutWidget extends GetView<AboutControllerImp> {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutControllerImp>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.topics.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var uniqueTopics = controller.topics.toSet().toList();
              return About(
                AboutModel.fromJson(
                  controller.aboutData.firstWhere(
                      (data) => data['topic'] == uniqueTopics[index]),
                ),
                controller.aboutData
                    .where((data) => data['topic'] == uniqueTopics[index])
                    .toList(),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class About extends GetView<AboutControllerImp> {
  final AboutModel aboutModel;
  final List topicData;
  const About(this.aboutModel, this.topicData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${translateDatabase(
              aboutModel.topicAr,
              aboutModel.topic,
            )} :",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: topicData.map(
                (data) {
                  return Container(
                    width: 200,
                    margin: const EdgeInsets.only(
                      right: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1.5,
                        color: AppColor.grey,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            translateDatabase(
                              data['title_ar'],
                              data['title'],
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: 160,
                            height: 160,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '${AppLink.img}${data['img']}',
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 85,
                            child: Text(
                              "${translateDatabase(
                                data['description_ar'],
                                data['description'],
                              )}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
