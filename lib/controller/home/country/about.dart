import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../remote/data/home/country/about.dart';

abstract class AboutController extends GetxController {
  getData(country);
}

class AboutControllerImp extends AboutController {
  String? country;
  String? countryAR;

  StatusRequest statusRequest = StatusRequest.none;

  AboutData storeData = AboutData(Get.find());

  final aboutData = [];
  final topics = <String>[];

  @override
  getData(country) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeData.postdata(country);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success" && response['about'] != null) {
        topics.clear();
        aboutData.clear();
        for (var about in response['about']) {
          if (!topics.contains(about['topic'])) {
            topics.add(about['topic']);
            update();
          }
          aboutData.add(about);
          update();
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    country = Get.arguments['country'];
    countryAR = Get.arguments['country_ar'];
    getData(country);
    super.onInit();
  }
}
