import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../tools/design/color_panel.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});
  void main() {
    runApp(const Changepassword());
  }

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: AppColor.white),
            backgroundColor: const Color(0xFF166E98),
            title: Text(
              'Change Password'.tr,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            floating: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            TextFormField(),
            TextFormField(),
            const SizedBox(
              height: 20,
            ),
            const Center(
                child: Text(
              "COMING SOON",
              style: TextStyle(fontSize: 30),
            ))
          ]))
        ],
      ),
    );
  }
}
