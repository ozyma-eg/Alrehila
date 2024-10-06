import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../tools/class/status_request.dart';
import '../../../../../tools/functions/handing_data_controller.dart';
import '../../../../../tools/routes/app_route.dart';
import '../../../../remote/auth/signup.dart';
import '../../../../screens/settings/auth/signup/verifycode.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
  goToPolices();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController repassword;
  late bool checkbox;

  bool isshowPassword = true;
  bool isshowRePassword = true;

  SignupData signupData = SignupData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  List data = [];

  @override
  signUp() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: 'Error', middleText: 'Wrong Confirm Password');
    }
    if (checkbox.toString() == "false") {
      Get.defaultDialog(
          title: 'Error',
          middleText: 'You must agree to the terms and conditions');
      phone.clear();
      return;
    }
    Future.delayed(
      const Duration(milliseconds: 20),
    );
    if (!formstatesignup.currentState!.validate()) {
      phone = TextEditingController();
    }
    if (formstatesignup.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postdata(
        username.text,
        password.text,
        email.text,
        phone.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.off(() => VerifyCodeSignUp(email: email.text));
        } else {
          Get.defaultDialog(
              title: "ُWarning",
              middleText: "Phone Number Or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.back();
  }

  @override
  goToPolices() {
    Get.toNamed(AppRoute.terms);
  }

  showPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  showRePassword() {
    isshowRePassword = isshowRePassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    checkbox = false;
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
