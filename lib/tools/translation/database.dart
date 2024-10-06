import 'package:alrehila/tools/services/services.dart';
import 'package:get/get.dart';

translateDatabase(arabicColumn, englishColumn) {
  Services myServices = Get.find();
  if (myServices.sharedPreferences.getInt("selectedLanguage") == 1) {
    return arabicColumn;
  } else {
    return englishColumn;
  }
}
