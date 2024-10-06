import 'package:alrehila/controller/home/settings/polices/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import '../../../../tools/design/color_panel.dart';

class Terms extends StatefulWidget {
  const Terms({super.key});

  @override
  State<Terms> createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  TermsController controller = Get.put(TermsControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            backgroundColor: AppColor.primary,
            elevation: 0.0,
            title: CustomTextAppBar(
              text: 'Terms And Conditions'.tr,
              fontColor: AppColor.white,
            ),
            floating: true,
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
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.privacy_tip_outlined),
                              title: Text(
                                'Privacy Policy'.tr,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColor.white,
                                ),
                              ),
                              onTap: () {
                                controller.goToPolices();
                              },
                            ),
                            const Divider(
                              height: 2,
                            ),
                            ListTile(
                              leading: const Icon(Icons.request_page),
                              title: Text(
                                'Terms of service'.tr,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColor.white,
                                ),
                              ),
                              onTap: () {
                                controller.goToTerms();
                              },
                            ),
                            const Divider(
                              height: 2,
                            ),
                            ListTile(
                              leading: const Icon(Icons.question_mark_rounded),
                              title: Text(
                                'FAQ'.tr,
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColor.white,
                                ),
                              ),
                              onTap: () {},
                            ),
                            const Divider(
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
