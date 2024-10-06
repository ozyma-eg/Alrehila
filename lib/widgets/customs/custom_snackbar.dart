import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBarConfig {
  static GetSnackBar buildSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    return GetSnackBar(
      title: title,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 70),
      maxWidth: 330,
      backgroundColor: backgroundColor,
      borderRadius: 20,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      duration: const Duration(seconds: 3),
      icon: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Icon(
          icon,
          size: 50,
        ),
      ),
      titleText: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w800,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
      ),
      messageText: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
