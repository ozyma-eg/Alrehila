import 'package:alrehila/screens/settings/auth/signin/signin.dart';
import 'package:alrehila/screens/settings/AboutUS/about.dart';
import 'package:alrehila/screens/settings/Support/contactus.dart';
import 'package:alrehila/screens/settings/polices/terms.dart';
import 'package:alrehila/screens/onboarding_screen/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../tools/routes/app_route.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../../tools/services/services.dart';
import '../../../remote/data/user/user_data.dart';
import '../../../screens/Home/bottombar.dart';
import '../../../screens/settings/Support/tawkto.dart';
import '../../../screens/settings/account/profile.dart';

abstract class SettingController extends GetxController {
  goToAppearance();
  goToMyAccount();
  signOut();
  goToSignIN();
  goToTawkto();
  contactus(BuildContext context);
  openWhatsapp();
  goToAboutApp();
  goToAboutUs();
  goToTerms();
  getData();
}

class SettingControllerImp extends SettingController {
  Services services = Get.find();
  GetUserData getUserData = GetUserData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List userData = [];
  late String? avatarUrl = services.sharedPreferences.getString("img");
  late String? name = services.sharedPreferences.getString("username");
  late String? email = services.sharedPreferences.getString("email");
  late String? phone = services.sharedPreferences.getString("phone");
  late int facebook = 0;
  late int google = 0;

  void reloadScreen() {
    final currentRoute = Get.currentRoute;
    Get.offAllNamed(currentRoute);
    Get.toNamed(currentRoute);
  }

  @override
  goToAppearance() {
    Get.toNamed(AppRoute.appearance);
  }

  @override
  goToMyAccount() {
    Get.to(
      () => const Profile(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  getData() async {
    userData.clear();
    email = services.sharedPreferences.getString("email") ?? '';
    if (services.sharedPreferences.getInt("signin") == 1) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await getUserData.postData(email!);
      statusRequest = await handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Map<String, dynamic> responseData = response['data'];
          userData.add(responseData);
          facebook = response['data']['facebook'];
          google = response['data']['google'];

          services.sharedPreferences
              .setString("img", response['data']['avatar']);
          services.sharedPreferences
              .setString("username", response['data']['name']);
          services.sharedPreferences
              .setString("email", response['data']['email']);
          if (response['data']['phone'] == null) {
            services.sharedPreferences.setString("phone", '');
          } else {
            services.sharedPreferences
                .setString("phone", response['data']['phone']);
          }
        } else {
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    services.sharedPreferences.setInt("signin", 0);
    Get.offAll(
      const BottomBar(initialPageIndex: 3),
      transition: Transition.size,
    );
    Get.snackbar(
      "",
      "",
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 70),
      maxWidth: 300,
      backgroundColor: Colors.red,
      borderRadius: 20,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      titleText: const Center(
        child: Text(
          "Success",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w800,
            fontSize: 19,
            color: AppColor.white,
          ),
        ),
      ),
      messageText: const Center(
        child: Text(
          "You have been signed out",
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: AppColor.white,
          ),
        ),
      ),
      duration: const Duration(seconds: 3),
    );
  }

  @override
  goToSignIN() {
    Get.to(
      () => const SignIn(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  goToTawkto() {
    Get.to(
      () => const TawkTO(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  contactus(BuildContext context) {
    services.sharedPreferences.getInt("signin") == 1 ||
            services.sharedPreferences.getInt("signin") == 2
        ? Get.to(
            () => const ContactUS(),
            transition: Transition.rightToLeft,
          )
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
    launchUrl(
      Uri.parse("https://wa.me//+201557977896"),
    );
  }

  @override
  goToAboutApp() {
    Get.to(
      () => const OnBoarding(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  goToTerms() {
    Get.to(
      () => const Terms(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  goToAboutUs() {
    Get.to(
      () => const AboutUS(),
      transition: Transition.rightToLeft,
    );
  }

  @override
  void onInit() async {
    super.onInit();
    await getData();
    if (userData.isNotEmpty) {
      avatarUrl = userData[0]['avatar'];
      name = userData[0]['name'];
    }
  }
}
