// * MAIN * //
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'tools/design/app_theme.dart';
import 'tools/getx_binding.dart';
import 'tools/routes/routes.dart';
import 'tools/services/services.dart';
import 'tools/translation/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: MyApp.themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: Binding(),
          translations: MyLocale(),
          themeMode: currentMode,
          darkTheme: darkTheme,
          theme: ThemeData(),
          getPages: routes,
        );
      },
    );
  }
}
