import 'package:get/get.dart';
import '../../../../tools/routes/app_route.dart';

abstract class ScuccessSignUpController extends GetxController {
  goToPageSignIn();
}

class ScuccessSignUpControllerImp extends ScuccessSignUpController {
  late String verifycode;

  @override
  goToPageSignIn() {
    Get.until((route) => Get.currentRoute == AppRoute.signin);
  }
}
