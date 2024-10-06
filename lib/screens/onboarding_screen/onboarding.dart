import 'static.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../tools/design/color_panel.dart';
import '../../controller/onboarding_screen/onboarding_controller.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late final OnBoardingContllorerImp controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(OnBoardingContllorerImp());
  }

  @override
  Widget build(BuildContext context) {
    Get.put(
      OnBoardingContllorerImp(),
    );
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: controller.pageController,
            builder: (context, child) {
              return PageView.builder(
                controller: controller.pageController,
                onPageChanged: (val) {
                  controller.onPageChanged(val);
                },
                itemCount: onBoardingList.length,
                itemBuilder: (context, i) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      onBoardingList[i].title!,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: 30,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Image.asset(
                      onBoardingList[i].image!,
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        onBoardingList[i].body!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 15,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  CustomDotControllerOnBoarding(),
                  SizedBox(
                    height: 15,
                  ),
                  CustomButtonOnBoarding(),
                  SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                controller.skip();
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: AppColor.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnBoardingModel {
  final String? title;
  final String? image;
  final String? body;
  OnBoardingModel({this.title, this.image, this.body});
}

class CustomButtonOnBoarding extends GetView<OnBoardingContllorerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * 0.9,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 2,
        ),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: AppColor.primary,
        child: Text(
          "Continue".tr,
          style: const TextStyle(
            height: 1,
            fontFamily: 'Nunito',
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingContllorerImp>(
      builder: ((controller) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardingList.length,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(
                    right: 3,
                  ),
                  duration: const Duration(milliseconds: 350),
                  width: controller.currentPage == index ? 20 : 5,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class CustomSliderOnBoarding extends GetView<OnBoardingContllorerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val) {
        controller.onPageChanged(val);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          Text(
            onBoardingList[i].title!,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 30,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Image.asset(
            onBoardingList[i].image!,
            height: 300,
            width: 250,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              onBoardingList[i].body!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primary,
                fontSize: 15,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
