import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> checkAppVersion(BuildContext context) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  try {
    await remoteConfig.fetchAndActivate();
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching remote config: $e');
    }
  }
  String currentVersion = packageInfo.version;
  String latestVersion = remoteConfig.getString('latest_app_version');

  if (currentVersion != latestVersion) {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New Version Available'),
        content: Text(
          'There Is A New Version Of The App Available. Please Update To The Latest Version.\n\n -New Version: $latestVersion',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Later'),
          ),
          TextButton(
            onPressed: () {
              launchUrl(
                Uri.parse(
                  "https://play.google.com/store/apps/details?id=online.alrehila.app",
                ),
              );
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  } else if (currentVersion == latestVersion) {
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Up-To-Date'),
        content: const Text(
          'Your App Version is Up-To-Date',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }
}
