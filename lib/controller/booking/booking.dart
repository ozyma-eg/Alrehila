import 'package:alrehila/tools/routes/app_route.dart';
import 'package:get/get.dart';
import '../../tools/services/services.dart';

abstract class BookingController extends GetxController {
  goToSignin();
}

class BookingControllerImp extends BookingController {
  Services services = Get.find();

  @override
  goToSignin() {
    Get.toNamed(AppRoute.signin);
  }
}
