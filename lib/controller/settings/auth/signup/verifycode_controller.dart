import 'package:alrehila/screens/settings/auth/signin/signin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../../remote/auth/verifycodesignup.dart';
import '../../../../widgets/customs/custom_snackbar.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  goToSignIn(String verifycode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  String? email;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSignIn(verifycode) async {
    int retries = 0;
    while (true) {
      if (retries >= 3) {
        statusRequest = StatusRequest.none;
        if (kDebugMode) {
          print("Timeout occurred");
        }
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: 'Timeout out',
            message: 'Email verfication failed,\n Please try again later.',
            backgroundColor: Colors.red,
            icon: Icons.close,
          ),
        );
        update();
        break;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodeSignUpData.postdata(
        email!,
        verifycode,
      );
      statusRequest = await handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.to(
          () => const SignIn(),
          arguments: {
            "email": email,
          },
          transition: Transition.rightToLeft,
        );
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: 'Success',
            message: 'Signed up successfully',
            backgroundColor: Colors.green,
            icon: Icons.done_rounded,
          ),
        );
        update();
        break;
      } else if (StatusRequest.failure == statusRequest) {
        retries++;
        statusRequest = StatusRequest.none;
        Future.delayed(
          const Duration(
            milliseconds: 10000,
          ),
        ).then(
          (_) async {
            if (retries < 3) {
              await goToSignIn(verifycode);
              update();
            }
          },
        );
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: 'Warning',
            message: 'Verify code not correct',
            backgroundColor: Colors.red,
            icon: Icons.close,
          ),
        );
        update();
        break;
      } else if (StatusRequest.serverException == statusRequest) {
        retries++;
        if (kDebugMode) {
          print("Retrying...");
        }
        Future.delayed(
          const Duration(
            milliseconds: 10000,
          ),
        ).then(
          (_) async {
            if (retries < 3) {
              await goToSignIn(verifycode);
              update();
            }
          },
        );
      }
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
