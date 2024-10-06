import 'package:alrehila/tools/routes/app_route.dart';
import 'package:get/get.dart';

abstract class EventsController extends GetxController {
  goToClassicEvents();
  goToPremiumEvents();
}

class EventsControllerImp extends EventsController {
  @override
  goToClassicEvents() {
    Get.toNamed(AppRoute.classicEvents);
  }

  @override
  goToPremiumEvents() {
    Get.toNamed(AppRoute.premiumEvents);
  }
}
