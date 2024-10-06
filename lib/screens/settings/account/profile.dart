import 'dart:io';
import 'package:alrehila/controller/settings/account/profile.dart';
import 'package:alrehila/tools/class/handling_data_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../link_api.dart';
import '../../../../tools/design/color_panel.dart';
import '../../../../tools/services/services.dart';
import '../../../controller/settings/settings.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ProfileControllerImp controller = ProfileControllerImp();
  SettingControllerImp settingControllerImp = SettingControllerImp();

  @override
  Widget build(BuildContext context) {
    Services services = Get.find();
    Get.put(ProfileControllerImp());
    Get.put(SettingControllerImp());
    String? avatarUrl = services.sharedPreferences.getString("img");

    return WillPopScope(
      onWillPop: () {
        return controller.backButton();
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColor.white,
          ),
          backgroundColor: AppColor.primary,
          centerTitle: true,
          title: Text(
            'Profile'.tr,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            ),
          ),
          leading: TextButton(
            onPressed: () {
              controller.backButton();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.white,
            ),
          ),
        ),
        body: GetBuilder<ProfileControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Form(
                key: controller.profileFormKey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            String selectedImagePath =
                                await controller.selectImageFromGallery();
                            setState(() {
                              controller.selectedImagePath = selectedImagePath;
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.2,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: controller.selectedImagePath == ''
                                  ? CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      radius:
                                          MediaQuery.of(context).size.width *
                                              0.18,
                                      backgroundImage:
                                          CachedNetworkImageProvider(
                                        services.sharedPreferences
                                                        .getInt("signin") ==
                                                    2 ||
                                                services.sharedPreferences
                                                        .getInt("signin") ==
                                                    3
                                            ? avatarUrl!
                                            : "${AppLink.img}${controller.img}",
                                      ),
                                    )
                                  : Image.file(
                                      File(controller.selectedImagePath),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      width:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.userFocusNode.requestFocus();
                            },
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 15),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        focusNode: controller.userFocusNode,
                                        controller: controller.username,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              const TextStyle(fontSize: 14),
                                          hintText: "Name".tr,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 30,
                                          ),
                                          label: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 9),
                                            child: Text(
                                              "Name".tr,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          suffixIcon: const Icon(Icons.person),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(
                                                12.0,
                                              ),
                                            ),
                                          ),
                                          builder: (context) {
                                            return Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Enter your name'.tr,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        controller.username,
                                                    readOnly: false,
                                                    decoration:
                                                        const InputDecoration(
                                                      hintText:
                                                          'Enter your name here',
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      MaterialButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        textColor:
                                                            AppColor.primary,
                                                        child:
                                                            Text("Cancel".tr),
                                                      ),
                                                      const Spacer(),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          controller
                                                              .updateName();
                                                        },
                                                        textColor:
                                                            AppColor.primary,
                                                        child:
                                                            Text("Submit".tr),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          GestureDetector(
                            onTap: () {
                              controller.emailFocusNode.requestFocus();
                            },
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 15),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        focusNode: controller.emailFocusNode,
                                        controller: controller.email,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              const TextStyle(fontSize: 14),
                                          hintText: "Email".tr,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 30,
                                          ),
                                          label: Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 9,
                                            ),
                                            child: Text(
                                              "Email".tr,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          suffixIcon: const Icon(Icons.mail),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                        //   onTap: () {
                                        //     showModalBottomSheet(
                                        //       context: context,
                                        //       shape: const RoundedRectangleBorder(
                                        //         borderRadius: BorderRadius.only(
                                        //           topLeft: Radius.circular(12.0),
                                        //           topRight: Radius.circular(
                                        //             12.0,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       builder: (context) {
                                        //         return Padding(
                                        //           padding: const EdgeInsets.all(15),
                                        //           child: Column(
                                        //             crossAxisAlignment:
                                        //                 CrossAxisAlignment.start,
                                        //             mainAxisSize: MainAxisSize.min,
                                        //             children: [
                                        //               const Text(
                                        //                 'Enter your email',
                                        //                 style: TextStyle(
                                        //                   fontWeight: FontWeight.bold,
                                        //                 ),
                                        //               ),
                                        //               TextFormField(
                                        //                 controller: controller.email,
                                        //                 readOnly: false,
                                        //                 decoration:
                                        //                     const InputDecoration(
                                        //                   hintText:
                                        //                       'Enter your mail here',
                                        //                 ),
                                        //               ),
                                        //               Row(
                                        //                 children: [
                                        //                   MaterialButton(
                                        //                     onPressed: () {
                                        //                       Navigator.of(context)
                                        //                           .pop();
                                        //                     },
                                        //                     textColor:
                                        //                         AppColor.primary,
                                        //                     child:
                                        //                         const Text("Cancel"),
                                        //                   ),
                                        //                   const Spacer(),
                                        //                   MaterialButton(
                                        //                     onPressed: () {
                                        //                       controller
                                        //                           .updateEmail();
                                        //                     },
                                        //                     textColor:
                                        //                         AppColor.primary,
                                        //                     child:
                                        //                         const Text("Submit"),
                                        //                   ),
                                        //                 ],
                                        //               )
                                        //             ],
                                        //           ),
                                        //         );
                                        //       },
                                        //     );
                                        //   },
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          GestureDetector(
                            onTap: () {
                              controller.emailFocusNode.requestFocus();
                            },
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 15),
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        focusNode: controller.phoneFocusNode,
                                        controller: controller.phone,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintStyle:
                                              const TextStyle(fontSize: 14),
                                          hintText: "Phone".tr,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 5,
                                            horizontal: 30,
                                          ),
                                          label: Container(
                                            margin: const EdgeInsets.symmetric(
                                              horizontal: 9,
                                            ),
                                            child: Text(
                                              "Phone".tr,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          suffixIcon: const Icon(Icons.phone),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned.fill(
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12.0),
                                              topRight: Radius.circular(
                                                12.0,
                                              ),
                                            ),
                                          ),
                                          builder: (context) {
                                            return Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Enter your phone'.tr,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        controller.phone,
                                                    readOnly: false,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter your phone here'
                                                              .tr,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      MaterialButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        textColor:
                                                            AppColor.primary,
                                                        child:
                                                            Text("Cancel".tr),
                                                      ),
                                                      const Spacer(),
                                                      MaterialButton(
                                                        onPressed: () {
                                                          controller
                                                              .updatePhone();
                                                        },
                                                        textColor:
                                                            AppColor.primary,
                                                        child:
                                                            Text("Submit".tr),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/images/google.png",
                                height: 35,
                                width: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Google Account: ".tr,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: controller.google == 1
                                    ? null
                                    : () {
                                        controller.googleLink();
                                      },
                                child: Text(
                                  controller.google == 1
                                      ? "Linked".tr
                                      : "Link".tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: controller.google == 1
                                        ? Colors.green.shade500
                                        : Colors.lightBlue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/images/facebook.png",
                                height: 35,
                                width: 35,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Facebook Account: ".tr,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: controller.facebook == 1
                                    ? null
                                    : () {
                                        controller.facebookLink();
                                      },
                                child: Text(
                                  controller.facebook == 1
                                      ? "Linked".tr
                                      : "Link".tr,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: controller.facebook == 1
                                        ? Colors.green.shade500
                                        : Colors.lightBlue,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
