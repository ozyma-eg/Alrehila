import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../firebase_options.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/translation/translation_controller.dart';
import '../../main.dart';

class Services extends GetxService with WidgetsBindingObserver {
  late SharedPreferences sharedPreferences;
  var notification = Permission.notification.status;

  Future<Services> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAppCheck.instance.activate(
      androidProvider: AndroidProvider.playIntegrity,
      appleProvider: AppleProvider.appAttest,
    );
    // await FirebaseMessaging.instance.getToken().then(
    //   (value) {
    //     String? token = value;
    //   },
    // );
    // await FirebaseMessaging.instance.subscribeToTopic("App");
    // await FirebaseMessaging.instance.unsubscribeFromTopic("App");
    if (kDebugMode) {
      print("----------------IN-APP-MESSAGING---------------");
    }
    FirebaseInAppMessaging.instance.printInfo();
    if (await notification.isDenied) {
      Permission.notification.request();
    }
    sharedPreferences = await SharedPreferences.getInstance();
    var selectedThemeMode = sharedPreferences.getInt("selectedThemeMode") ?? 0;
    if (selectedThemeMode == 0) {
      MyApp.themeNotifier.value = ThemeMode.system;
    }
    if (selectedThemeMode == 1) {
      MyApp.themeNotifier.value = ThemeMode.light;
    }
    if (selectedThemeMode == 2) {
      MyApp.themeNotifier.value = ThemeMode.dark;
    }
    TranslateController translateController = Get.put(TranslateController());
    var selectedLanguage = sharedPreferences.getInt("selectedLanguage") ?? 0;
    if (selectedLanguage == 0) {
      translateController.changelang('en');
    }
    if (selectedLanguage == 1) {
      translateController.changelang('ar');
    }

    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print("=========================================");
        print(message);
        print("=========================================");
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        String routeToOpen = message.data['route'];
        if (kDebugMode) {
          print(routeToOpen);
          print(message);
          print("opened");
        }
      },
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
      }
      Navigator.pushNamed(
        Get.context!,
        '/message',
        arguments: MessageArguments(message, true),
      );
    });

    return this;
  }
}

Future<void> initialServices() async {
  await Get.putAsync(() => Services().init());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = true;

Future<void> setupFlutterNotifications() async {
  channel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          icon: 'launch_background',
        ),
      ),
    );
  }
}

late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class MessageArguments {
  final RemoteMessage message;
  final bool openedFromNotification;

  MessageArguments(this.message, this.openedFromNotification);
}
