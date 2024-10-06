import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../tools/class/handling_data_view.dart';
import '../../../../../../tools/design/color_panel.dart';
import '../../../../../../tools/functions/valid_input.dart';
import '../../../../controller/settings/auth/forget_password/resetpassword_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: Text(
          'Reset Password'.tr,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColor.white,
          ),
        ),
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColor.white,
          ),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 35,
            ),
            child: Form(
              key: controller.formstateresetpassword,
              child: ListView(
                children: [
                  LottieBuilder.asset(
                    "assets/lottie/code2.json",
                    height: 250,
                    width: 250,
                  ),
                  Text(
                    'New Password'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: AppColor.white,
                    ),
                  ),
                  Text(
                    'Please Enter a New Password'.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller) => CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.password,
                      iconData: controller.isshowPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      labeltext: "Password",
                      hinttext: '',
                      isNumber: false,
                      obscureText: controller.isshowPassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GetBuilder<ResetPasswordControllerImp>(
                    builder: (controller) => CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.repassword,
                      iconData: controller.isshowRePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      labeltext: "Confirm Password",
                      hinttext: '',
                      isNumber: false,
                      obscureText: controller.isshowRePassword,
                      onTapIcon: () {
                        controller.showRePassword();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    text: "Save Password",
                    onPressed: () {
                      controller.resetSuccess();
                    },
                    fontColor: AppColor.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
