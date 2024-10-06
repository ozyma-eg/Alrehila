import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../tools/class/handling_data_view.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../tools/functions/valid_input.dart';
import '../../../controller/settings/Support/mail.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    Get.put(SupportMailControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 0.0,
        title: Text(
          'Support'.tr,
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
      body: GetBuilder<SupportMailControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Form(
              key: controller.formstatemail,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  LottieBuilder.asset(
                    "assets/lottie/help.json",
                    height: 200,
                  ),
                  Center(
                    child: Text(
                      "Need Help?".tr,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Center(
                    child: Text(
                      "Send us message now".tr,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    validator: (val) {
                      return validInput(val!, 1, 100, "subject");
                    },
                    controller: controller.subject,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 30,
                      ),
                      label: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 9,
                        ),
                        child: Text(
                          "subject".tr,
                        ),
                      ),
                      suffixIcon: const InkWell(
                        child: Icon(
                          Icons.subtitles_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    minLines: 3,
                    maxLines: 50,
                    keyboardType: TextInputType.multiline,
                    validator: (val) {
                      return validInput(val!, 1, 1000, "description");
                    },
                    controller: controller.description,
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 30,
                      ),
                      label: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 9,
                        ),
                        child: Text(
                          "description".tr,
                        ),
                      ),
                      suffixIcon: const InkWell(
                        child: Icon(
                          Icons.description_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomButton(
                    text: "Send".tr,
                    onPressed: () {
                      controller.sendSupportMail();
                    },
                    fontColor: AppColor.primary,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
