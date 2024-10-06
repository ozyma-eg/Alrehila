import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/class/status_request.dart';
import '../../../tools/functions/handing_data_controller.dart';
import '../../../tools/services/services.dart';
import '../../remote/data/freelancers.dart';

abstract class GuideDataController extends GetxController {
  getData();
}

class GuideDataControllerImp extends GuideDataController {
  GlobalKey<FormState> formstatesignin = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  Services services = Get.find();
  FreelancersData guideData = FreelancersData(Get.find());
  List guides = [];

  @override
  getData() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await guideData.getData();
      if (kDebugMode) {
        print("Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          guides.clear();
          guides.addAll(response['guides']);
          update();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
