import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import '../../../../../../tools/design/color_panel.dart';
import '../../../../controller/settings/auth/signup/signup_success_controller.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    ScuccessSignUpControllerImp controller = Get.put(
      ScuccessSignUpControllerImp(),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: CustomTextAppBar(
          text: "Creation Success",
          fontColor: AppColor.primary,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(
          15,
        ),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppColor.primary,
              ),
            ),
            const Spacer(),
            const CustomTextBody(
              text: "Your Account Has Been Created Successfuly",
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: "Go To SignIn",
                onPressed: () {
                  controller.goToPageSignIn();
                },
                fontColor: AppColor.primary,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
