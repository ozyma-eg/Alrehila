import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../tools/design/color_panel.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BG.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.02,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'About Us'.tr,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 2,
                      width: screenWidth * 0.3,
                      child: Container(
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Who we are'.tr,
                      style: const TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: screenWidth * 0.9,
                      child: Text(
                        'We are a group of youth who cooperated in the year 2021 in the field of application development and programming, and we always try to find problems and solve them in the most appropriate way possible, and the idea of developing this program came to us from a personal experience when we traveled to the Arab Emirates in 2022 and in fact we did not have enough information about the country, transportation or tourist attractions, so we decided not to repeat what we experienced with others by developing this program and making it at the level of all the Arab countries.'
                            .tr,
                        style: const TextStyle(
                          color: AppColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Works:'.tr,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: screenWidth * 0.9,
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: AppColor.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: screenWidth * 0.25,
                                margin: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.asset(
                                    'assets/images/Fixware.png',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      'Fixware'.tr,
                                      style: const TextStyle(
                                        color: AppColor.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.56,
                                      child: Text(
                                        'Fixware was our first work at all, the idea of the application is to remedy and solve the problems of modern technology through an application that provides everything the user needs from cutting his computer or needs to repair it and cannot or wants courses and courses to learn hardware skills or if he is interested in programming or design and wants to learn them and acquire their skills.'
                                            .tr,
                                        style: const TextStyle(
                                          color: AppColor.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Text(
                          'Our Goals:'.tr,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '- Spread our Arabic culture all over the world.'.tr,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '- Enjoy every single momment in your trip.'.tr,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '- reduce the scamming precentage.'.tr,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '- Make your Experience as best as it could be.'.tr,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        // const SizedBox(
                        //   height: 17,
                        // ),
                        // const Text(
                        //   'Parteners:',
                        //   style: TextStyle(
                        //     color: AppColor.white,
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.w600,
                        //   ),
                        //   textAlign: TextAlign.start,
                        // ),
                        // const SizedBox(
                        //   height: 7,
                        // ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: screenHeight * 0.17,
                        //       width: screenWidth * 0.445,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(
                        //             width: 2, color: Colors.blue.shade900),
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: Column(
                        //         children: [
                        //           Container(
                        //             width: screenWidth * 0.2,
                        //             height: screenHeight * 0.1,
                        //             margin: const EdgeInsets.all(10),
                        //             child: ClipRRect(
                        //               borderRadius: BorderRadius.circular(13),
                        //               child: Image.asset(
                        //                   'assets/images/Factory Yard.png'),
                        //             ),
                        //           ),
                        //           Text(
                        //             'Factory Yard',
                        //             style: TextStyle(
                        //               color: Colors.blue.shade900,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w600,
                        //             ),
                        //             textAlign: TextAlign.start,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       width: 4,
                        //     ),
                        //     Container(
                        //       height: screenHeight * 0.17,
                        //       width: screenWidth * 0.445,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(
                        //           width: 2,
                        //           color: Colors.red.shade900,
                        //         ),
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: Column(
                        //         children: [
                        //           Container(
                        //             width: screenWidth * 0.2,
                        //             margin: const EdgeInsets.all(10),
                        //             child: ClipRRect(
                        //               borderRadius: BorderRadius.circular(13),
                        //               child: Image.asset(
                        //                 'assets/images/Techno Damnhour.png',
                        //               ),
                        //             ),
                        //           ),
                        //           Text(
                        //             'Techno Future',
                        //             style: TextStyle(
                        //               color: Colors.red.shade900,
                        //               fontSize: 15,
                        //               fontWeight: FontWeight.w600,
                        //             ),
                        //             textAlign: TextAlign.start,
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Powered by'.tr,
                          style:const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 2,
                            ),
                            Image.asset(
                              "assets/images/ozyma.png",
                              height: 11,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 20,
                  left: Get.locale!.languageCode == 'en' ? 10 : null,
                  right: Get.locale!.languageCode == 'en' ? null : 10,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
