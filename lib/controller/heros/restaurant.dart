import 'package:alrehila/remote/favorite/beach/add.dart';
import 'package:alrehila/remote/favorite/beach/remove.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../tools/class/status_request.dart';
import '../../../tools/functions/handing_data_controller.dart';
import '../../../tools/services/services.dart';

abstract class RestaurantHeroController extends GetxController {
  addFavorite();
  removeFavorite();
}

class RestaurantHeroControllerImp extends RestaurantHeroController {
  StatusRequest statusRequest = StatusRequest.none;
  AddBeachFavorite add = AddBeachFavorite(Get.find());
  RemoveBeachFavorite remove = RemoveBeachFavorite(Get.find());
  Services services = Get.find();
  late int userId;
  late String restaurantId;

  @override
  addFavorite() async {
    if (kDebugMode) {
      print("added");
    }
    userId = services.sharedPreferences.getInt('id')!;
    statusRequest = StatusRequest.loading;
    update();
    var response = await add.post(
      userId.toString(),
      restaurantId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFavorite() async {
    if (kDebugMode) {
      print("removed");
    }
    userId = services.sharedPreferences.getInt('id')!;
    statusRequest = StatusRequest.loading;
    update();
    var response = await remove.post(
      userId.toString(),
      restaurantId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
