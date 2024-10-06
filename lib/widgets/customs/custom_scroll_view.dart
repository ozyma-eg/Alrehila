import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_gesture_detector.dart';

class CustomScrollViewCountryModel extends StatefulWidget {
  final String citiesImage;
  final void Function()? citiesRoute;
  final String aboutTitle;
  final String aboutImage;
  final void Function()? aboutRoute;
  final String storeImage;
  final void Function()? storeRoute;
  final String eventsImage;
  final void Function()? eventsRoute;
  final String servicesImage;
  final void Function()? servicesRoute;

  const CustomScrollViewCountryModel({
    super.key,
    required this.citiesImage,
    required this.citiesRoute,
    required this.aboutTitle,
    required this.aboutImage,
    required this.aboutRoute,
    required this.storeImage,
    required this.storeRoute,
    required this.eventsImage,
    required this.eventsRoute,
    required this.servicesImage,
    required this.servicesRoute,
  });

  @override
  State<CustomScrollViewCountryModel> createState() =>
      CustomScrollViewCountryModelState();
}

class CustomScrollViewCountryModelState
    extends State<CustomScrollViewCountryModel> {
  late double itemExtent;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    itemExtent = MediaQuery.of(context).size.width / 2;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        itemExtent = MediaQuery.of(context).size.width /
            (orientation == Orientation.portrait ? 1 : 2);
        return CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: itemExtent,
                mainAxisSpacing: 0,
                childAspectRatio:
                    orientation == Orientation.portrait ? 1.7 : 1.4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Widget child;
                  switch (index) {
                    case 0:
                      child = CustomGestureDetector(
                        title: 'Cities'.tr,
                        image: widget.citiesImage,
                        route: widget.citiesRoute,
                        width: itemExtent,
                      );
                      break;
                    case 1:
                      child = CustomGestureDetector(
                        title: widget.aboutTitle.tr,
                        image: widget.aboutImage,
                        route: widget.aboutRoute,
                        width: itemExtent,
                      );
                      break;
                    case 2:
                      child = CustomGestureDetector(
                        title: 'Store'.tr,
                        image: widget.storeImage,
                        route: widget.storeRoute,
                        width: itemExtent,
                      );
                      break;
                    case 3:
                      child = CustomGestureDetector(
                        title: 'Events'.tr,
                        image: widget.eventsImage,
                        route: widget.eventsRoute,
                        width: itemExtent,
                      );
                      break;
                    case 4:
                      child = CustomGestureDetector(
                        title: ''.tr,
                        image: widget.servicesImage,
                        route: widget.servicesRoute,
                        width: itemExtent,
                      );
                      break;
                    case 5:
                      child = GestureDetector(
                        child: const SizedBox(height: 300),
                      );
                      break;
                    case 6:
                      child = ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const SizedBox(
                          height: 70,
                        ),
                      );
                      break;
                    default:
                      child = Container();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: child,
                  );
                },
                childCount: orientation == Orientation.portrait ? 6 : 7,
              ),
            ),
          ],
        );
      },
    );
  }
}
