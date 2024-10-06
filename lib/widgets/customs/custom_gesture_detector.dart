import 'package:flutter/material.dart';
import '../../tools/design/color_panel.dart';

class CustomGestureDetector extends StatelessWidget {
  final String title;
  final String image;
  final double width;
  final void Function()? route;

  const CustomGestureDetector({
    super.key,
    required this.title,
    required this.image,
    required this.width,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              20,
            ),
            child: Image.asset(
              image,
              width: width,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
