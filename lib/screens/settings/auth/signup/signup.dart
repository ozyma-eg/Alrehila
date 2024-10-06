import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import '../../../../../../tools/class/handling_data_view.dart';
import '../../../../../../tools/design/color_panel.dart';
import '../../../../../../tools/functions/valid_input.dart';
import '../../../../controller/settings/auth/signup/signup_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: CustomTextAppBar(
          text: "Sign Up".tr,
          fontColor: AppColor.white,
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
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 30,
            ),
            child: Form(
              key: controller.formstatesignup,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextTitle(
                    text: "Welcome to our app".tr,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextBody(
                    text: "Sign Up With Your Email And Password".tr,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextForm(
                    valid: (val) {
                      return validInput(val!, 3, 16, "username");
                    },
                    mycontroller: controller.username,
                    iconData: Icons.person_outline,
                    labeltext: "Username".tr,
                    hinttext: '',
                    isNumber: false,
                    obscureText: false,
                  ),
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
                  CustomPhoneForm(
                    valid: (val) {
                      return validInput(val!, 7, 14, "phone");
                    },
                    mycontroller: controller.phone,
                    iconData: Icons.phone_android_outlined,
                    labeltext: "Phone (optional)".tr,
                    hinttext: '',
                  ),
                  GetBuilder<SignUpControllerImp>(
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
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) => CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                      mycontroller: controller.repassword,
                      iconData: controller.isshowRePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      labeltext: "Confirm Password".tr,
                      hinttext: '',
                      isNumber: false,
                      obscureText: controller.isshowRePassword,
                      onTapIcon: () {
                        controller.showRePassword();
                      },
                    ),
                  ),
                  GetBuilder<SignUpControllerImp>(
                    builder: (controller) => CustomCheckbox(
                      onTap: () {
                        controller.goToPolices();
                      },
                      valid: (isChecked) {
                        return validInput(
                            isChecked.toString(), 0, 9, "checkbox");
                      },
                      text: "I have read and accept ".tr,
                      linktext: "terms and conditions".tr,
                      initialValue: isChecked,
                      onChanged: (value) {
                        setState(
                          () {
                            controller.checkbox = isChecked = value!;
                          },
                        );
                      },
                      value: isChecked,
                    ),
                  ),
                  CustomButton(
                    text: "Sign Up".tr,
                    onPressed: () {
                      if (controller.phone.text.isNotEmpty) {
                        if (controller.phone.text.isPhoneNumber) {
                          phoneSubmition(controller.phone);
                        }
                      }
                      Future.delayed(
                        const Duration(milliseconds: 25),
                        () {
                          controller.signUp();
                        },
                      );
                    },
                    fontColor: AppColor.primary,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextSignUpOrSignIn(
                    textone: " have an account ? ".tr,
                    texttwo: "Sign In".tr,
                    onTap: () {
                      controller.goToSignIn();
                    },
                    fontColor: AppColor.primary,
                  ),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Search',
                  //   ),
                  //   onChanged: (value) {
                  //     setState(() {
                  //       searchText = value;
                  //     });
                  //   },
                  // ),
                  // SizedBox(height: 16.0),
                  // Text('Selected Options:'),
                  // SizedBox(height: 8.0),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: filteredOptions.length,
                  //     itemBuilder: (context, index) {
                  //       final option = filteredOptions[index];
                  //       final isSelected = selectedOptions.contains(option);

                  //       return ListTile(
                  //         title: Text(option),
                  //         trailing: isSelected
                  //             ? Icon(Icons.check_circle)
                  //             : Icon(Icons.check_circle_outline),
                  //         onTap: () {
                  //           toggleSelection(option);
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
