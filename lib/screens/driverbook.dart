import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_customs/flutter_customs.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../tools/design/color_panel.dart';
import '../../tools/functions/valid_input.dart';
import '../../tools/services/services.dart';
import '../controller/driverbook.dart';
import 'package:intl/intl.dart';

class DriverBook extends StatefulWidget {
  const DriverBook({super.key});

  @override
  State<DriverBook> createState() => _DriverBookState();
}

class _DriverBookState extends State<DriverBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColor.white,
        ),
        title: const Text(
          'Alrehila',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          ),
        ),
        backgroundColor: AppColor.primary,
        centerTitle: true,
      ),
      // drawer: const DrawerScreen(),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Services services = Get.find();
  FixedExtentScrollController pickerController = FixedExtentScrollController();

  @override
  Widget build(BuildContext context) {
    Get.put(DriverBookControllerImp());
    return Scaffold(
      body: GetBuilder<DriverBookControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formstatebook,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: 170,
                  child: LottieBuilder.asset("assets/lottie/Driver.json"),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Booking'.tr,
                    style: TextStyle(
                      fontSize: 22,
                      color: AppColor.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.noPeople.text.isEmpty) {
                      controller.noPeople.text = '1';
                    }
                    int initialValue = int.parse(controller.noPeople.text) - 1;
                    pickerController = FixedExtentScrollController(
                      initialItem: initialValue,
                    );

                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 240,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  color: AppColor.primary,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: CupertinoPicker(
                                  itemExtent: 40,
                                  scrollController: pickerController,
                                  onSelectedItemChanged: (int index) {
                                    int selectedValue = index + 1;
                                    if (selectedValue == 1) {
                                      controller.noPeople.text = '1';
                                    } else {
                                      controller.noPeople.text =
                                          selectedValue.toString();
                                    }
                                  },
                                  children:
                                      List<Widget>.generate(14, (int index) {
                                    return Center(
                                      child: Text(
                                        '${index + 1}',
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ).then((value) {
                      pickerController.dispose();
                    });
                  },
                  child: AbsorbPointer(
                    child: CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 2, 'noPeople');
                      },
                      mycontroller: controller.noPeople,
                      iconData: Icons.person_outline,
                      labeltext: "NO. of People".tr,
                      hinttext: '',
                      isNumber: true,
                      obscureText: false,
                    ),
                  ),
                ),
                CustomTextForm(
                  valid: (val) {
                    return validInput(val!, 4, 19, 'Destination');
                  },
                  mycontroller: controller.destinationTo,
                  iconData: Icons.location_city,
                  labeltext: "Destination".tr,
                  hinttext: '',
                  isNumber: false,
                  obscureText: false,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.fromTime.text.isEmpty) {
                      controller.fromTime.text =
                          DateFormat('dd/HH/mm/a').format(DateTime.now());
                    }
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 240,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  color: AppColor.primary,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        mode:
                                            CupertinoDatePickerMode.dateAndTime,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged: (DateTime newDate) {
                                          setState(
                                            () {
                                              controller.fromTime.text =
                                                  DateFormat('dd/HH/mm/a')
                                                      .format(newDate);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: AbsorbPointer(
                    child: CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 15, 'From');
                      },
                      mycontroller: controller.fromTime,
                      iconData: Icons.calendar_month_outlined,
                      labeltext: "From".tr,
                      hinttext: '',
                      isNumber: false,
                      obscureText: false,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.toTime.text.isEmpty) {
                      controller.toTime.text =
                          DateFormat('dd/HH/mm/a').format(DateTime.now());
                    }

                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 240,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: MaterialButton(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  color: AppColor.primary,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(
                                      color: AppColor.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        mode:
                                            CupertinoDatePickerMode.dateAndTime,
                                        initialDateTime: DateTime.now(),
                                        onDateTimeChanged: (DateTime toDate) {
                                          setState(
                                            () {
                                              controller.toTime.text =
                                                  DateFormat('dd/HH/mm/a')
                                                      .format(toDate);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: AbsorbPointer(
                    child: CustomTextForm(
                      valid: (val) {
                        return validInput(val!, 1, 15, 'To');
                      },
                      mycontroller: controller.toTime,
                      iconData: Icons.calendar_month_outlined,
                      labeltext: "To".tr,
                      hinttext: '',
                      isNumber: false,
                      obscureText: false,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: CustomButton(
                    text: "Book".tr,
                    onPressed: () {
                      controller
                          .book(context)
                          .then((_) {})
                          .catchError((error) {});
                    },
                    fontColor: AppColor.primary,
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
