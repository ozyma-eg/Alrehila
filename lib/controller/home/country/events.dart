import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../remote/data/home/country/events.dart';

abstract class EventsController extends GetxController {
  getData(country);
}

class EventsControllerImp extends EventsController {
  String? country;
  String? countryAR;

  StatusRequest statusRequest = StatusRequest.none;

  EventsData storeData = EventsData(Get.find());

  final eventsData = [];

  @override
  getData(country) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storeData.postdata(country);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        eventsData.clear();
        eventsData.addAll(response['events']);
        update();
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
