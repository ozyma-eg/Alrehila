import 'package:alrehila/tools/class/handling_data_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../link_api.dart';
import '../../../main.dart';
import '../../../tools/design/color_panel.dart';
import '../../../tools/services/services.dart';
import '../../controller/settings/settings.dart';
import '../../controller/translation/translation_controller.dart';
import '../../tools/functions/alert_exit_app.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Services services = Get.find();
  ThemeMode themeMode = MyApp.themeNotifier.value;
  Color primaryColor = AppColor.primary;
  ThemeMode? selectedThemeMode = MyApp.themeNotifier.value;
  late bool? selectedLanguage;
  late bool isEnglishSelected;
  late bool isArabicSelected;
  late bool systemChecked;
  late bool lightChecked;
  late bool darkChecked;

  @override
  void initState() {
    super.initState();

    systemChecked = services.sharedPreferences.getBool('systemChecked') ?? true;
    lightChecked = services.sharedPreferences.getBool('lightChecked') ?? false;
    darkChecked = services.sharedPreferences.getBool('darkChecked') ?? false;

    isEnglishSelected = dropdownvalue == "English";
    isArabicSelected = dropdownvalue == "العربية";
    final storedThemeMode =
        services.sharedPreferences.getInt("selectedThemeMode");
    if (storedThemeMode != null) {
      selectedThemeMode = ThemeMode.values[storedThemeMode];
    }
  }

  String dropdownvalue = 'English'.tr;
  var items = ['English', 'العربية'];
  SettingControllerImp controller = Get.put(SettingControllerImp());
  TranslateController translateController = Get.find();

  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp());
    late String selectedTheme;
    if (selectedThemeMode == ThemeMode.system) {
      selectedTheme = 'System';
    } else if (selectedThemeMode == ThemeMode.light) {
      selectedTheme = 'Light';
    } else if (selectedThemeMode == ThemeMode.dark) {
      selectedTheme = 'Dark';
    }

    return WillPopScope(
      onWillPop: () {
        return alertExitApp();
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: const IconThemeData(color: AppColor.white),
              backgroundColor: AppColor.primary,
              title: Text(
                'Settings'.tr,
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: AppColor.white,
                ),
              ),
              centerTitle: true,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Column(
                    children: [
                      services.sharedPreferences.getInt("signin") == 1 ||
                              services.sharedPreferences.getInt("signin") ==
                                  2 ||
                              services.sharedPreferences.getInt("signin") == 3
                          ? GetBuilder<SettingControllerImp>(
                              builder: (controller) => HandlingDataView(
                                statusRequest: controller.statusRequest,
                                widget: Container(
                                  color: AppColor.primary,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: AppColor.white,
                                          radius: 30,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                            services.sharedPreferences
                                                            .getInt("signin") ==
                                                        2 ||
                                                    services.sharedPreferences
                                                            .getInt("signin") ==
                                                        3
                                                ? controller.avatarUrl!
                                                : "${AppLink.img}${controller.avatarUrl}",
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.name!,
                                              style: const TextStyle(
                                                color: AppColor.white,
                                                fontSize: 17,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              color: AppColor.primary,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black45,
                                      radius: 30,
                                      child: Icon(
                                        Icons.account_circle_outlined,
                                        size: 37,
                                        color: AppColor.primary,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Sign in to see deals and discounts, \n manage your trips, book hotels, and more."
                                                .tr,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: AppColor.white,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: FilledButton.tonal(
                                            onPressed: () {
                                              controller.goToSignIN();
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                const Color.fromARGB(
                                                    255, 30, 174, 241),
                                              ),
                                            ),
                                            child: Text("Sign In".tr),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "General".tr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            services.sharedPreferences.getInt("signin") == 1 ||
                                    services.sharedPreferences
                                            .getInt("signin") ==
                                        2 ||
                                    services.sharedPreferences
                                            .getInt("signin") ==
                                        3
                                ? ListTile(
                                    leading:
                                        const Icon(Icons.account_box_outlined),
                                    title: Text(
                                      "Account".tr,
                                    ),
                                    onTap: () {
                                      controller.goToMyAccount();
                                    },
                                  )
                                : Container(), //change password
                            services.sharedPreferences.getInt("signin") == 1 ||
                                    services.sharedPreferences
                                            .getInt("signin") ==
                                        2 ||
                                    services.sharedPreferences
                                            .getInt("signin") ==
                                        3
                                ? const SizedBox(
                                    height: 1,
                                  )
                                : ListTile(
                                    leading: const Icon(
                                      Icons.exit_to_app,
                                    ),
                                    title: Text("Sign In".tr),
                                    onTap: () {
                                      controller.goToSignIN();
                                    },
                                  ),
                            ListTile(
                              leading: const Icon(Icons.color_lens_outlined),
                              title: Text('Appearance'.tr),
                              trailing: InkWell(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      selectedTheme.tr,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back_ios_new_outlined,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text("Select Theme Mode".tr),
                                          ),
                                        ],
                                      ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RadioListTile<ThemeMode>(
                                            title: Row(
                                              children: [
                                                Text('System'.tr),
                                                const Spacer(),
                                                const Icon(
                                                    Icons.brightness_4_rounded),
                                              ],
                                            ),
                                            value: ThemeMode.system,
                                            groupValue: selectedThemeMode,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedTheme = 'System'.tr;
                                                Navigator.pop(context);
                                                selectedThemeMode = value;
                                                systemChecked = true;
                                                lightChecked = false;
                                                darkChecked = false;
                                                if (selectedThemeMode != null) {
                                                  MyApp.themeNotifier.value =
                                                      selectedThemeMode!;
                                                  services.sharedPreferences
                                                      .setInt(
                                                    "selectedThemeMode",
                                                    selectedThemeMode!.index,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "systemChecked",
                                                    systemChecked,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "lightChecked",
                                                    lightChecked,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "darkChecked",
                                                    darkChecked,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                          RadioListTile<ThemeMode>(
                                            title: Row(
                                              children: [
                                                Text('Light'.tr),
                                                const Spacer(),
                                                const Icon(Icons.light_mode),
                                              ],
                                            ),
                                            value: ThemeMode.light,
                                            groupValue: selectedThemeMode,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedTheme = 'Light'.tr;
                                                Navigator.pop(context);
                                                selectedThemeMode = value;
                                                systemChecked = false;
                                                lightChecked = true;
                                                darkChecked = false;
                                                if (selectedThemeMode != null) {
                                                  MyApp.themeNotifier.value =
                                                      selectedThemeMode!;
                                                  services.sharedPreferences
                                                      .setInt(
                                                    "selectedThemeMode",
                                                    selectedThemeMode!.index,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "systemChecked",
                                                    systemChecked,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "lightChecked",
                                                    lightChecked,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "darkChecked",
                                                    darkChecked,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                          RadioListTile<ThemeMode>(
                                            title: Row(
                                              children: [
                                                Text('Dark'.tr),
                                                const Spacer(),
                                                const Icon(Icons.dark_mode),
                                              ],
                                            ),
                                            value: ThemeMode.dark,
                                            groupValue: selectedThemeMode,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedTheme = 'Dark'.tr;
                                                Navigator.pop(context);
                                                selectedThemeMode = value;
                                                systemChecked = false;
                                                lightChecked = false;
                                                darkChecked = true;
                                                if (selectedThemeMode != null) {
                                                  MyApp.themeNotifier.value =
                                                      selectedThemeMode!;
                                                  services.sharedPreferences
                                                      .setInt(
                                                    "selectedThemeMode",
                                                    selectedThemeMode!.index,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "systemChecked",
                                                    systemChecked,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "lightChecked",
                                                    lightChecked,
                                                  );
                                                  services.sharedPreferences
                                                      .setBool(
                                                    "darkChecked",
                                                    darkChecked,
                                                  );
                                                }
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ), //darklight
                            ListTile(
                              leading: const Icon(Icons.language),
                              title: Text('App Language :'.tr),
                              trailing: InkWell(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      dropdownvalue,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 17,
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 220,
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 13,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.65,
                                                child: Center(
                                                  child: Text(
                                                    "App Language".tr,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ListTile(
                                            leading: Checkbox(
                                              value: isEnglishSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedLanguage = value;
                                                  isEnglishSelected =
                                                      value ?? false;
                                                  isArabicSelected = false;
                                                  services.sharedPreferences
                                                      .setInt(
                                                    "selectedLanguage",
                                                    0,
                                                  );
                                                  if (isEnglishSelected) {
                                                    dropdownvalue = "English";
                                                    translateController
                                                        .changelang("en");
                                                  }
                                                });
                                              },
                                            ),
                                            title: const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "English",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                  ),
                                                ),
                                                Text(
                                                  "(Default)",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              setState(() {
                                                isEnglishSelected = true;
                                                isArabicSelected = false;
                                                dropdownvalue = "English";
                                                translateController
                                                    .changelang("en");
                                                services.sharedPreferences
                                                    .setInt(
                                                  "selectedLanguage",
                                                  0,
                                                );
                                              });
                                            },
                                          ),
                                          ListTile(
                                            leading: Checkbox(
                                              value: isArabicSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedLanguage = value;
                                                  isArabicSelected =
                                                      value ?? false;
                                                  isEnglishSelected = false;
                                                  services.sharedPreferences
                                                      .setInt(
                                                    "selectedLanguage",
                                                    1,
                                                  );
                                                  if (isArabicSelected) {
                                                    dropdownvalue = "العربية";
                                                    translateController
                                                        .changelang("ar");
                                                  }
                                                });
                                              },
                                            ),
                                            title: Row(
                                              children: [
                                                const Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "العربية",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                    Text(
                                                      "Arabic",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width:
                                                      dropdownvalue == 'العربية'
                                                          ? 40
                                                          : 47,
                                                ),
                                                Center(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.orange[600],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.4)),
                                                    width: dropdownvalue ==
                                                            'العربية'
                                                        ? 45
                                                        : 35,
                                                    child: Center(
                                                      child: Text(
                                                        "Beta".tr,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              setState(() {
                                                isArabicSelected = true;
                                                isEnglishSelected = false;
                                                dropdownvalue = "العربية";
                                                translateController
                                                    .changelang("ar");
                                                services.sharedPreferences
                                                    .setInt(
                                                  "selectedLanguage",
                                                  1,
                                                );
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            // ListTile(
                            //   onTap: () {
                            //     Get.toNamed(AppRoute.DriverBook);
                            //   },
                            //   title: Text("Driver"),
                            // ),
                            // App Language
                            ListTile(
                              leading: const Icon(
                                Icons.group,
                              ),
                              title: Text("Invite a friend".tr),
                              onTap: () {
                                Share.share(
                                    "Hey, \n \n Alrehila is an app built for tourist. With the app, you can find tourguides ,hotels ,restaurants and more \n \n Get it for free at \n https://play.google.com/store/apps/details?id=online.alrehila.app");
                              },
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Support".tr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.live_help_outlined),
                                  title: Text('Live chat'.tr),
                                  onTap: () {
                                    controller.goToTawkto();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.email_outlined),
                                  title: Text('Contact US'.tr),
                                  onTap: () {
                                    controller.contactus(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.wechat_sharp),
                                  title: Text('WhatsApp'.tr),
                                  onTap: () {
                                    controller.openWhatsapp();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.newspaper),
                                  title: Text('Terms'.tr),
                                  onTap: () {
                                    controller.goToTerms();
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "About".tr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.info_outline_rounded,
                                  ),
                                  title: Text(
                                    'About Alrehila'.tr,
                                    style: const TextStyle(),
                                  ),
                                  onTap: () {
                                    controller.goToAboutApp();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.laptop_mac_rounded,
                                  ),
                                  title: Text(
                                    'About US'.tr,
                                    style: const TextStyle(),
                                  ),
                                  onTap: () {
                                    controller.goToAboutUs();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Icons.web_asset,
                                  ),
                                  title: Text(
                                    'Our Website'.tr,
                                    style: const TextStyle(),
                                  ),
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          'https://alrehila.elmopamrg.com'),
                                    );
                                  },
                                ),
                              ],
                            ),
                            services.sharedPreferences.getInt("signin") == 1 ||
                                    services.sharedPreferences
                                            .getInt("signin") ==
                                        2 ||
                                    services.sharedPreferences
                                            .getInt("signin") ==
                                        3
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                        leading: const Icon(
                                          Icons.exit_to_app,
                                        ),
                                        title: Text(
                                          "Sign Out".tr,
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                        onTap: () {
                                          controller.signOut();
                                        },
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 1,
                                  ), //signout
                            Container(
                              height: 55,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "© 2022-2024  OZYMA  |  All rights reserved"
                                          .tr,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // const Text("Build Number: "),
                                        // const SizedBox(width: 5),
                                        FutureBuilder<PackageInfo>(
                                          future: PackageInfo.fromPlatform(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot<PackageInfo>
                                                  snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                '${snapshot.data?.version}',
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                ),
                                              );
                                            } else {
                                              return const Text('Loading...');
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
