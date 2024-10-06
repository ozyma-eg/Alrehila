import 'package:alrehila/screens/settings/polices/privacypolicy.dart';
import 'package:alrehila/screens/settings/polices/termsofservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../tools/class/status_request.dart';
import '../../../../../tools/services/services.dart';

abstract class TermsController extends GetxController {
  goToPolices();
  goToTerms();
}

class TermsControllerImp extends TermsController {
  GlobalKey<FormState> formstatesignin = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  Services services = Get.find();

  @override
  goToPolices() {
    Get.to(
      () => const PrivacyPolicy(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  goToTerms() {
    Get.to(
      () => const TermsOfService(),
      transition: Transition.rightToLeft,
    );
  }
}
