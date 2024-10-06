import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../remote/data/home/country/store.dart';

abstract class StoreController extends GetxController {
  getData(country);
}

class StoreControllerImp extends StoreController {
  String? country;
  String? countryAR;

  StatusRequest statusRequest = StatusRequest.none;

  StoreData storedata = StoreData(Get.find());

  final storeData = [];

  List<String> selectedSizes = [];

  void addSelectedSize(String size) {
    selectedSizes.add(size);
    update();
  }

  void removeSelectedSize(String size) {
    selectedSizes.remove(size);
    update();
  }

  @override
  getData(country) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await storedata.postdata(country);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        storeData.clear();
        storeData.addAll(response['store']);
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
