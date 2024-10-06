import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../controller/settings/Support/support.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  SupportController controller = Get.put(SupportControllerImp());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
              ),
            ),
            iconTheme: const IconThemeData(
              color: AppColor.white,
            ),
            backgroundColor: AppColor.primary,
            title: Text(
              'Support'.tr,
              style: const TextStyle(
                fontSize: 25,
                color: AppColor.white,
              ),
            ),
            centerTitle: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 210,
                        child:
                            LottieBuilder.asset("assets/lottie/SUPPORT.json"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.live_help_outlined),
                              title: Text('Live chat'.tr),
                              onTap: () {
                                controller.goToTawkto();
                              },
                            ),
                            const Divider(
                              height: 2,
                            ),
                            ListTile(
                              leading: const Icon(Icons.email_outlined),
                              title: Text('Contact US'.tr),
                              onTap: () {
                                controller.contactus(context);
                              },
                            ),
                            const Divider(
                              height: 2,
                            ),
                            ListTile(
                              leading: const Icon(Icons.wechat_sharp),
                              title: Text('WhatsApp'.tr),
                              onTap: () {
                                controller.openWhatsapp();
                              },
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
