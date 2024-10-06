import 'package:alrehila/screens/settings/auth/password/resetpassword.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../tools/class/status_request.dart';
import '../../../../tools/functions/handing_data_controller.dart';
import '../../../../tools/services/services.dart';
import '../../../../remote/auth/forgetpassword/verifycode.dart';
import '../../../../widgets/customs/custom_snackbar.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifycode;
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  Services services = Get.find();

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
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
            message: 'Email verfication failed, Please try again later.',
            backgroundColor: Colors.red,
            icon: Icons.close,
          ),
        );
        update();
        break;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await verifyCodeForgetPasswordData.postdata(
        email!,
        verifycode,
      );
      if (kDebugMode) {
        print("Controller $response ");
      }
      statusRequest = await handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.to(
          () => const ResetPassword(),
          arguments: {
            "email": email,
          },
          transition: Transition.rightToLeft,
        );
        update();
        break;
      } else if (StatusRequest.failure == statusRequest) {
        retries++;
        statusRequest = StatusRequest.none;
        update();
        Get.showSnackbar(
          CustomSnackBarConfig.buildSnackBar(
            title: 'Warning',
            message: 'Verify code not correct',
            backgroundColor: Colors.red,
            icon: Icons.close,
          ),
        );
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
              await goToResetPassword(verifycode);
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
