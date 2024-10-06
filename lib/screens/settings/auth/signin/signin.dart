import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../tools/class/handling_data_view.dart';
import '../../../../../../tools/design/color_panel.dart';
import '../../../../../../tools/functions/valid_input.dart';
import '../../../../controller/settings/auth/signin/signin_controller.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: Text(
          'Sign In'.tr,
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
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: Form(
              key: controller.formstatesignin,
              child: ListView(
                children: [
                  LottieBuilder.asset(
                    "assets/lottie/user.json",
                    height: 120,
                    width: 120,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Welcome Back".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontFamily: 'Nunito',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBody(
                    text: "Sign In With Your Email And Password".tr,
                  ),
                  const SizedBox(height: 15),
                  CustomTextForm(
                    valid: (val) {
                      return validInput(val!, 5, 35, "email");
                    },
                    mycontroller: controller.email,
                    iconData: Icons.email_outlined,
                    labeltext: "Email".tr,
                    hinttext: '',
                    isNumber: false,
                    obscureText: false,
                  ),
                  GetBuilder<LoginControllerImp>(
                    builder: (controller) => CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.password,
                      iconData: controller.isshowPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      labeltext: "Password".tr,
                      hinttext: '',
                      isNumber: false,
                      obscureText: controller.isshowPassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: Text(
                      "Forgot Password".tr,
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CustomButton(
                    text: "Sign In".tr,
                    onPressed: () {
                      controller.signin();
                    },
                    fontColor: AppColor.primary,
                  ),
                  const SizedBox(height: 40),
                  CustomTextSignUpOrSignIn(
                    textone: "Don't have an account ? ".tr,
                    texttwo: "SignUp".tr,
                    onTap: () {
                      controller.goToSignUp();
                    },
                    fontColor: AppColor.primary,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: const Divider(
                              height: 36,
                            )),
                      ),
                      Text("OR".tr),
                      Expanded(
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: const Divider(
                            height: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.gSignin();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image(
                                image: const AssetImage(
                                  'assets/images/google.png',
                                ),
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 23,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.fSignin();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              child: Image(
                                image: const AssetImage(
                                  'assets/images/facebook.png',
                                ),
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
