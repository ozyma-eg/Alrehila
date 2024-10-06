import 'package:alrehila/tools/routes/app_route.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../tools/services/services.dart';
import '../../tools/class/status_request.dart';
import '../../tools/functions/handing_data_controller.dart';
import '../remote/data/user/favorite.dart';

abstract class SavedController extends GetxController {
  createList();
  getData();
  search();
}

class SavedControllerImp extends SavedController {
  Services services = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  Favorite favorite = Favorite(Get.find());

  List data = [];

  @override
  getData() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await favorite.getData(
        services.sharedPreferences.getInt('id').toString(),
      );
      if (kDebugMode) {
        print("Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          data.clear();
          data.addAll(response['data']);
          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      update();
    }
  }

  @override
  search() {
    if (services.sharedPreferences.getInt("signin") == 1 ||
        services.sharedPreferences.getInt("signin") == 2 ||
        services.sharedPreferences.getInt("signin") == 3) {
      Get.toNamed(AppRoute.search);
    } else {
      Get.toNamed(AppRoute.signin);
    }
  }

  @override
  createList() {}

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
