import 'dart:ui';
import 'package:get/get.dart';

class TranslateController extends GetxController {
  void changelang(String langcode) {
    Locale locale = Locale(langcode);
    Get.updateLocale(locale);
  }
}
