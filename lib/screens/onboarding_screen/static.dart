import 'onboarding.dart';
import 'package:get/get.dart';
import '../../../tools/design/img_assets.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "Alrehila",
    body:
        "Alrehila is an app to help people travelling to Arab World find the best places to visit"
            .tr,
    image: AppImageAsset.travel,
  ),
  OnBoardingModel(
    title: "Hotels and Places".tr,
    body:
        "Alrehila provide the user with the top hotels to stay in and also the best places to visit"
            .tr,
    image: AppImageAsset.hotel,
  ),
  OnBoardingModel(
    title: "All About Arab World".tr,
    body:
        "Alrehila also helps you with some useful information about the arab world"
            .tr,
    image: AppImageAsset.food,
  ),
  OnBoardingModel(
    title: "Tour Guide Booking".tr,
    body:
        "Alrehila saves you a lot of time as we have the best tour guides you would find"
            .tr,
    image: AppImageAsset.time,
  ),
];
