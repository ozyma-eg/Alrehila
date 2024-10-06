import 'package:get/get.dart';
import '../../../tools/class/status_request.dart';
import '../../../tools/functions/handing_data_controller.dart';
import '../../../tools/routes/app_route.dart';
import '../../remote/data/home/country.dart';

abstract class CountryController extends GetxController {
  getData(country);
  gotoGovernorate(governorate, governorateAR);
  gotoAbout(country, countryAR);
  // gotoEvents(country, countryAR);
  gotoEvents();
  gotoStore(country, countryAR);
}

class CountryControllerImp extends CountryController {
  String? country;
  String? countryAR;

  StatusRequest statusRequest = StatusRequest.none;

  CountryData countrydata = CountryData(Get.find());

  final countryData = [];
  final governoratesData = [];

  @override
  getData(country) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await countrydata.postdata(country);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        countryData.clear();
        governoratesData.clear();
        countryData.addAll(response['country']);
        governoratesData.addAll(response['governorates']);
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  gotoGovernorate(governorate, governorateAR) {
    Get.toNamed(
      arguments: {"governorate": governorate, "governorateAR": governorateAR},
      AppRoute.governorate,
    );
  }

  @override
  gotoAbout(country, countryAR) {
    Get.toNamed(
      arguments: {
        "country": country,
        "countryAR": countryAR,
      },
      AppRoute.about,
    );
  }

  @override
  gotoEvents(/*country, countryAR*/) {
    // Get.toNamed(
    //   arguments: {
    //     "country": country,
    //     "countryAR": countryAR,
    //   },
    //   AppRoute.Events,
    // );
    Get.toNamed(AppRoute.events);
  }

  @override
  gotoStore(country, countryAR) {
    Get.toNamed(
      arguments: {
        "country": country,
        "countryAR": countryAR,
      },
      AppRoute.store,
    );
  }

  @override
  void onInit() {
    country = Get.arguments['country'];
    countryAR = Get.arguments['countryAR'];
    getData(country);
    super.onInit();
  }
}
