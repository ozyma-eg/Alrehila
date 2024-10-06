import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../tools/routes/app_route.dart';
import '../../../../../tools/services/services.dart';

abstract class SupportController extends GetxController {
  goToTawkto();
  contactus(BuildContext context);
  openWhatsapp();
}

class SupportControllerImp extends SupportController {
  Services services = Get.find();

  @override
  goToTawkto() {
    Get.toNamed(AppRoute.tawkto);
  }

  @override
  contactus(BuildContext context) {
    services.sharedPreferences.getInt("signedin") == 1
        ? Get.toNamed(AppRoute.contactUS)
        : showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Sign-In Required'),
              content: const Text(
                'You need to signin first to use ths section',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Okay'),
                ),
              ],
            ),
          );
  }

  @override
  openWhatsapp() {
    launchUrl(Uri.parse("https://wa.me//+201021207569"));
  }
}
