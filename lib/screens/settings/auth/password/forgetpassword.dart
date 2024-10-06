import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../tools/class/handling_data_view.dart';
import '../../../../../../tools/design/color_panel.dart';
import '../../../../../../tools/functions/valid_input.dart';
import '../../../../controller/settings/auth/forget_password/forgetpassword_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: Text(
          'Forget Password'.tr,
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
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: Form(
              key: controller.formstateforgetpassword,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  LottieBuilder.asset(
                    "assets/lottie/mail.json",
                    height: 180,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextTitle(
                    text: "Check Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBody(
                    text:
                        "please Enter Your Email Address To Recive A Verification Code",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextForm(
                    valid: (val) {
                      return validInput(val!, 5, 35, "email");
                    },
                    mycontroller: controller.email,
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    hinttext: '',
                    isNumber: false,
                    obscureText: false,
                  ),
                  CustomButton(
                    text: "Check",
                    onPressed: () {
                      controller.checkemail();
                    },
                    fontColor: AppColor.primary,
                  ),
                  const SizedBox(
                    height: 40,
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
