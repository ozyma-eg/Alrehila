import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/design/color_panel.dart';
import '../../../main.dart';
import '../../../tools/services/services.dart';
import '../../controller/translation/translation_controller.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  TranslateController translateController = Get.find();
  Services services = Get.find();
  ThemeMode themeMode = MyApp.themeNotifier.value;
  Color primaryColor = AppColor.primary;
  ThemeMode? selectedThemeMode = MyApp.themeNotifier.value;
  late bool systemChecked;
  late bool lightChecked;
  late bool darkChecked;

  @override
  void initState() {
    super.initState();
    systemChecked = services.sharedPreferences.getBool('systemChecked') ?? true;
    lightChecked = services.sharedPreferences.getBool('lightChecked') ?? false;
    darkChecked = services.sharedPreferences.getBool('darkChecked') ?? false;
    if (kDebugMode) {
      print("system = $systemChecked");
      print("light = $lightChecked");
      print("dark = $darkChecked");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(
              color: AppColor.white,
            ),
            backgroundColor: AppColor.primary,
            title: Text(
              'Settings'.tr,
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
                      Padding(
                        padding: const EdgeInsets.all(
                          15.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 20.0,
                                    ),
                                    child: const Divider(
                                      height: 36,
                                    ),
                                  ),
                                ),
                                const Text("Theme Mode"),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 20.0,
                                      right: 10.0,
                                    ),
                                    child: const Divider(
                                      height: 36,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                              leading:
                                  const Icon(Icons.brightness_medium_rounded),
                              title: Text('Theme Mode'.tr),
                              trailing: Checkbox(
                                value: systemChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        systemChecked = true;
                                        lightChecked = false;
                                        darkChecked = false;
                                        services.sharedPreferences
                                            .setBool("systemChecked", true);
                                        services.sharedPreferences
                                            .setBool("lightChecked", false);
                                        services.sharedPreferences
                                            .setBool("darkChecked", false);
                                        services.sharedPreferences
                                            .setInt("selectedThemeMode", 1);
                                      } else {
                                        selectedThemeMode = ThemeMode.system;
                                        MyApp.themeNotifier.value =
                                            selectedThemeMode!;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.system;
                                  MyApp.themeNotifier.value = ThemeMode.system;
                                },
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.light_mode),
                              title: Text('Light'.tr),
                              trailing: Checkbox(
                                value: lightChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        systemChecked = false;
                                        lightChecked = true;
                                        darkChecked = false;
                                        services.sharedPreferences
                                            .setBool("systemChecked", false);
                                        services.sharedPreferences
                                            .setBool("lightChecked", true);
                                        services.sharedPreferences
                                            .setBool("darkChecked", false);
                                        services.sharedPreferences
                                            .setInt("selectedThemeMode", 2);
                                      } else {
                                        selectedThemeMode = ThemeMode.system;
                                        MyApp.themeNotifier.value =
                                            selectedThemeMode!;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.light;
                                  MyApp.themeNotifier.value = ThemeMode.light;
                                  AppColor.greysystem == AppColor.lightgrey;
                                },
                              ),
                            ),
                            ListTile(
                              leading: const Icon(Icons.dark_mode),
                              title: Text('Dark'.tr),
                              trailing: Checkbox(
                                value: darkChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        systemChecked = false;
                                        lightChecked = false;
                                        darkChecked = true;
                                        services.sharedPreferences
                                            .setBool("systemChecked", false);
                                        services.sharedPreferences
                                            .setBool("lightChecked", false);
                                        services.sharedPreferences
                                            .setBool("darkChecked", true);
                                        services.sharedPreferences
                                            .setInt("selectedThemeMode", 3);
                                      } else {
                                        selectedThemeMode = ThemeMode.system;
                                        MyApp.themeNotifier.value =
                                            selectedThemeMode!;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.dark;
                                  MyApp.themeNotifier.value = ThemeMode.dark;
                                },
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 20.0),
                                      child: const Divider(
                                        height: 36,
                                      )),
                                ),
                                const Text("Custom Themes"),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20.0, right: 10.0),
                                    child: const Divider(
                                      height: 36,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                              leading: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.ginzary,
                                ),
                              ),
                              title: const Text("Default"),
                              trailing: Checkbox(
                                value: darkChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        AppColor.primary = AppColor.ginzary;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.dark;
                                  MyApp.themeNotifier.value = ThemeMode.dark;
                                },
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.red,
                                ),
                              ),
                              title: const Text("Red"),
                              trailing: Checkbox(
                                value: darkChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        AppColor.primary = AppColor.red;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.dark;
                                  MyApp.themeNotifier.value = ThemeMode.dark;
                                },
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.gnzali,
                                ),
                              ),
                              title: const Text("Gnzali"),
                              trailing: Checkbox(
                                value: darkChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        AppColor.primary = AppColor.gnzali;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.dark;
                                  MyApp.themeNotifier.value = ThemeMode.dark;
                                },
                              ),
                            ),
                            ListTile(
                              leading: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColor.black,
                                ),
                              ),
                              title: const Text("Black"),
                              trailing: Checkbox(
                                value: darkChecked,
                                onChanged: (bool? value) {
                                  setState(
                                    () {
                                      if (value = true) {
                                        AppColor.primary = AppColor.black;
                                      }
                                    },
                                  );
                                  selectedThemeMode = ThemeMode.dark;
                                  MyApp.themeNotifier.value = ThemeMode.dark;
                                },
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
          ),
        ],
      ),
    );
  }
}
