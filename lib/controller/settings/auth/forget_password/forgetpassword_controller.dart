import 'package:alrehila/screens/settings/auth/password/verifycode.dart';
import 'package:alrehila/widgets/customs/custom_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../../remote/auth/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstateforgetpassword = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late TextEditingController email;

  @override
  checkemail() async {
    if (formstateforgetpassword.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postdata(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.to(
          () => VerifyCode(email: email.text),
          transition: Transition.rightToLeft,
        );
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: "Warning",
            message: "An email has been sent",
            backgroundColor: Colors.green,
            icon: Icons.check_circle,
          ),
        );
        if (kDebugMode) {
          print("Mail sent");
        }
      } else {
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: "Warning",
            message: "Email not registered",
            backgroundColor: Colors.red,
            icon: Icons.close,
          ),
        );
        statusRequest = StatusRequest.failure;
        update();
      }

      update();
    } else {}
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  void goToSignIn() {}
}
