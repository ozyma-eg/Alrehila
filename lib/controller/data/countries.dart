import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/class/status_request.dart';
import '../../../tools/functions/handing_data_controller.dart';
import '../../../tools/routes/app_route.dart';
import '../../../tools/services/services.dart';
import '../../remote/data/home/countries.dart';

abstract class CountryDataController extends GetxController {
  getData();
  gotoCountry(country, countryAR);
  about();
}

class CountryDataControllerImp extends CountryDataController {
  GlobalKey<FormState> formstatesignin = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  Services services = Get.find();
  CountriesData countriesData = CountriesData(Get.find());
  List countrys = [];
  List hotels = [];
  List beaches = [];
  List places = [];
  List restaurants = [];
  late int aboutValue;

  @override
  getData() async {
    try {
      statusRequest = StatusRequest.countriesLoading;
      var response = await countriesData.getData(
        services.sharedPreferences.getInt('id').toString(),
      );
      if (kDebugMode) {
        print("Controller $response ");
      }
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          countrys.clear();
          hotels.clear();
          beaches.clear();
          places.clear();
          restaurants.clear();
          countrys.addAll(response['countries']);
          hotels.addAll(response['data']
              .where(
                (element) => ['hotel'].contains(
                  element['type'],
                ),
              )
              .toList());
          beaches.addAll(response['data']
              .where(
                (element) => ['beach'].contains(
                  element['type'],
                ),
              )
              .toList());
          places.addAll(response['data']
              .where(
                (element) => ['place'].contains(
                  element['type'],
                ),
              )
              .toList());
          restaurants.addAll(response['data']
              .where(
                (element) => ['restaurant'].contains(
                  element['type'],
                ),
              )
              .toList());
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
  gotoCountry(country, countryAR) async {
    Get.toNamed(
      arguments: {"country": country, "country_ar": countryAR},
      AppRoute.country,
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  about() {
    throw UnimplementedError();
  }
}
