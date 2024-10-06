import 'package:flutter/material.dart';
import '../tools/design/color_panel.dart';

// SOON //
class Airport extends StatelessWidget {
  const Airport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        centerTitle: true,
        title: const Text(
          'Airport trips',
        ),
      ),
    );
  }
}
