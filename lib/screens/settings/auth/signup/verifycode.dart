import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import '../../../../../../tools/class/handling_data_view.dart';
import '../../../../../../tools/design/color_panel.dart';
import '../../../../controller/settings/auth/signup/verifycode_controller.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: Text(
          'Code'.tr,
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
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: ListView(
              children: [
                LottieBuilder.asset(
                  'assets/lottie/code.json',
                  height: 250,
                  width: 250,
                ),
                Text(
                  'Check Code'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: AppColor.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Please Enter The Digit Code Sent To $email'.tr,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColor.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                OTPTextField(
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: ValueNotifier(ThemeMode.system) ==
                            ValueNotifier(ThemeMode.light)
                        ? AppColor.white
                        : AppColor.black,
                    focusBorderColor: const Color(0xFF166E98),
                  ),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                  onChanged: (String code) {},
                  onCompleted: (String verificationCode) {
                    controller.goToSignIn(verificationCode);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
