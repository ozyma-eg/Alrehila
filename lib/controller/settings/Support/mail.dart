import 'package:alrehila/remote/functions/send_mail.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../tools/class/status_request.dart';
import '../../../../../tools/functions/handing_data_controller.dart';
import '../../../../../tools/services/services.dart';

abstract class SupportMailController extends GetxController {
  sendSupportMail();
}

class SupportMailControllerImp extends SupportMailController {
  GlobalKey<FormState> formstatemail = GlobalKey<FormState>();
  SendMail sendMail = SendMail(Get.find());
  Services services = Get.find();

  late TextEditingController subject;
  late TextEditingController description;
  late String userMail = services.sharedPreferences.getString('email') ?? '';
  late String userName = services.sharedPreferences.getString('username') ?? '';
  late String userID = services.sharedPreferences.getInt('id').toString();
  StatusRequest statusRequest = StatusRequest.none;

  @override
  sendSupportMail() async {
    if (!formstatemail.currentState!.validate()) {
      if (kDebugMode) {
        print("form state not valid");
      }
    }
    int retries = 0;
    while (true) {
      if (retries == 2) {
        services.sharedPreferences.getInt('id').toString();
      }
      if (retries >= 3) {
        statusRequest = StatusRequest.none;
        if (kDebugMode) {
          print("Timeout occurred. Cannot send email.");
        }
        Get.snackbar(
          "Timeout out",
          "Email send failed, Please try again later.",
          snackPosition: SnackPosition.BOTTOM,
        );
        subject = TextEditingController();
        description = TextEditingController();
        update();
        break;
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await sendMail.sendData(
        subject.text,
        description.text,
        userMail,
        userName,
        userID,
      );
      if (kDebugMode) {
        print("Controller $response ");
      }
      statusRequest = await handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.snackbar(
          "Thank you for contacting us",
          "We will do our best with this.",
          snackPosition: SnackPosition.BOTTOM,
        );
        subject = TextEditingController();
        description = TextEditingController();
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
              await sendSupportMail();
              update();
            }
          },
        );
      }
    }
  }

  @override
  void onInit() {
    subject = TextEditingController();
    description = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    subject.dispose();
    description.dispose();
    super.dispose();
  }
}
