import '../../../tools/functions/alert_exit_app.dart';
import 'package:alrehila/screens/Home/bottombar.dart';
import '../../../tools/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeSkeleton extends StatefulWidget {
  const HomeSkeleton({super.key});

  @override
  State<HomeSkeleton> createState() => _HomeSkeletonState();
}

class _HomeSkeletonState extends State<HomeSkeleton> {
  Services services = Get.find();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return alertExitApp();
      },
      child: const Scaffold(
        body: BottomBar(),
      ),
    );
  }
}
