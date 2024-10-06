import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../tools/translation/database.dart';
import '../../../../controller/home/country/store.dart';
import '../../../../models/Home/store/store.dart';
import '../../../customs/custom_check_box.dart';

class StoreWidget extends GetView<StoreControllerImp> {
  const StoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreControllerImp>(
      builder: (controller) {
        return GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: controller.storeData.length,
          itemBuilder: (BuildContext context, int i) {
            return Store(
              StoreModel.fromJson(
                controller.storeData[i],
              ),
            );
          },
        );
      },
    );
  }
}

class Store extends GetView<StoreControllerImp> {
  final StoreModel storeModel;
  const Store(this.storeModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Details(storeModel);
          },
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              storeModel.name!,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                child: CachedNetworkImage(
                  imageUrl: '${AppLink.img}${storeModel.img}',
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Details extends GetView<StoreControllerImp> {
  final StoreModel storeModel;
  const Details(this.storeModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  storeModel.name!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Text(
                    "${'Price:'.tr} ${storeModel.average} \$".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Size: ".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomCheckbox(
                    key: const Key('M'),
                    title: 'M'.tr,
                    value: controller.selectedSizes.contains('M'),
                    onChanged: (newValue) {
                      if (controller.selectedSizes.contains('M')) {
                        controller.removeSelectedSize('M');
                      } else {
                        controller.addSelectedSize('M');
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomCheckbox(
                    key: const Key('L'),
                    title: 'L'.tr,
                    value: controller.selectedSizes.contains('L'),
                    onChanged: (newValue) {
                      if (controller.selectedSizes.contains('L')) {
                        controller.removeSelectedSize('L');
                      } else {
                        controller.addSelectedSize('L');
                      }
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomCheckbox(
                    key: const Key('XL'),
                    title: 'XL'.tr,
                    value: controller.selectedSizes.contains('XL'),
                    onChanged: (newValue) {
                      if (controller.selectedSizes.contains('XL')) {
                        controller.removeSelectedSize('XL');
                      } else {
                        controller.addSelectedSize('XL');
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "${'Details:'.tr} ${translateDatabase(
                      storeModel.descriptionAr,
                      storeModel.description,
                    )} ",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith(
                      (states) => AppColor.primary),
                ),
                child: Text(
                  "Add to cart".tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
