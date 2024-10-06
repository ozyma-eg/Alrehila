import 'package:alrehila/screens/Home/bottombar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../../remote/auth/forgetpassword/resetpassword.dart';
import '../../../../widgets/customs/custom_snackbar.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  resetSuccess();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstateresetpassword = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  late TextEditingController password;
  late TextEditingController repassword;
  StatusRequest statusRequest = StatusRequest.none;
  bool isshowPassword = true;
  bool isshowRePassword = true;
  String? email;

  showPassword() {
    isshowPassword = isshowPassword == true ? false : true;
    update();
  }

  showRePassword() {
    isshowRePassword = isshowRePassword == true ? false : true;
    update();
  }

  @override
  resetPassword() {}

  @override
  resetSuccess() async {
    int retries = 0;
    const maxRetries = 3;

    if (password.text != repassword.text) {
      Get.showSnackbar(
        CustomSnackBarConfig.buildSnackBar(
          title: 'Error',
          message: 'Wrong Confirm Password',
          backgroundColor: Colors.red,
          icon: Icons.check_circle,
        ),
      );
      return;
    }

    if (retries > maxRetries) {
      statusRequest = StatusRequest.none;
      Get.showSnackbar(
        CustomSnackBarConfig.buildSnackBar(
          title: 'Server time out',
          message: 'Please contact us.',
          backgroundColor: Colors.red,
          icon: Icons.check_circle,
        ),
      );
      update();
      return;
    }

    if (retries <= maxRetries) {
      statusRequest = StatusRequest.loading;
      update();

      var formdata = formstateresetpassword.currentState;

      if (formdata != null && formdata.validate()) {
        statusRequest = StatusRequest.loading;
        update();

        var response = await resetPasswordData.postdata(email!, password.text);

        statusRequest = handlingData(response);

        if (response != null && response['status'] == "success") {
          Get.offAll(
            () => const BottomBar(initialPageIndex: 3),
            transition: Transition.rightToLeft,
          );
          Get.showSnackbar(
            CustomSnackBarConfig.buildSnackBar(
              title: 'Success',
              message: 'Password has been reset',
              backgroundColor: Colors.green,
              icon: Icons.check_circle,
            ),
          );
          statusRequest = StatusRequest.success;
          update();
          return;
        } else {
          retries++;
          if (kDebugMode) {
            print("Retrying...");
          }
          await Future.delayed(
            const Duration(
              milliseconds: 20000,
            ),
          );
          if (retries == maxRetries) {
            Get.showSnackbar(
              CustomSnackBarConfig.buildSnackBar(
                title: "Warning",
                message: "Password reset failed ",
                backgroundColor: Colors.red,
                icon: Icons.close,
              ),
            );
            statusRequest = StatusRequest.failure;
          }
          update();
        }
      } else {
        retries++;
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: "Warning",
            message: "Password reset failed.\n Please contact us.",
            backgroundColor: Colors.red,
            icon: Icons.close,
          ),
        );
        statusRequest = StatusRequest.failure;
        update();
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
