import 'package:alrehila/remote/data/home/country/governorate.dart';
import 'package:get/get.dart';
import '../../../tools/class/status_request.dart';
import '../../../tools/functions/handing_data_controller.dart';
import '../../../tools/services/services.dart';
import '../../../widgets/Home/country/governorate/beaches.dart';
import '../../../widgets/Home/country/governorate/hotels.dart';
import '../../../widgets/Home/country/governorate/places.dart';
import '../../../widgets/Home/country/governorate/restaurants.dart';

abstract class GovernorateController extends GetxController {
  getData(governorate);
}

class GovernorateControllerImp extends GovernorateController {
  Services services = Get.find();
  String? governorate;
  String? id;

  int index = 0;

  StatusRequest statusRequest = StatusRequest.none;

  GovernorateData governoratedata = GovernorateData(Get.find());

  final governorateData = [];
  final beachsData = [];
  final hotelsData = [];
  final placesData = [];
  final restaurantsData = [];
  final data = [];

  @override
  getData(governorate) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await governoratedata.postdata(
        governorate, services.sharedPreferences.getInt('id').toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        governorateData.addAll(response['governorate']);
        if (response['governorate'][0]['beaches'] == 1) {
          if (response['beaches'] != '{"status":"failure"}' ||
              response['data']['type'] == 'beach') {
            beachsData.clear();
            data.remove(const BeachesSection());
            beachsData.addAll(response['data']
                .where(
                  (element) => ['beach'].contains(
                    element['type'],
                  ),
                )
                .toList());
            data.add(const BeachesSection());
            update();
          }
        }
        if (response['governorate'][0]['hotels'] == 1) {
          if (response['hotels'] != '{"status":"failure"}') {
            hotelsData.clear();
            data.remove(const HotelsSection());
            hotelsData.addAll(response['data']
                .where(
                  (element) => ['hotel'].contains(
                    element['type'],
                  ),
                )
                .toList());
            data.add(const HotelsSection());
            update();
          }
        }
        if (response['governorate'][0]['places'] == 1) {
          if (response['places'] != '{"status":"failure"}') {
            placesData.clear();
            data.remove(const PlacesSection());
            placesData.addAll(response['data']
                .where(
                  (element) => ['place'].contains(
                    element['type'],
                  ),
                )
                .toList());
            data.add(const PlacesSection());
            update();
          }
        }
        if (response['governorate'][0]['restaurants'] == 1) {
          if (response['restaurants'] != '{"status":"failure"}') {
            restaurantsData.clear();
            data.remove(const RestaurantsSection());
            restaurantsData.addAll(response['data']
                .where(
                  (element) => ['restaurant'].contains(
                    element['type'],
                  ),
                )
                .toList());
            data.add(const RestaurantsSection());
            update();
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    governorate = Get.arguments['governorate'];
    getData(governorate);
    super.onInit();
  }
}
