import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import '../../../../tools/services/services.dart';

abstract class DriverBookController extends GetxController {
  book(BuildContext context);
}

class DriverBookControllerImp extends DriverBookController {
  GlobalKey<FormState> formstatebook = GlobalKey<FormState>();
  late TextEditingController noPeople;
  late TextEditingController destinationTo;
  late TextEditingController fromTime;
  late TextEditingController toTime;
  Services services = Get.find();

  @override
  book(BuildContext context) async {
    var formdatabook = formstatebook.currentState;

    TimeOfDay? parseTimeOfDay(String timeString) {
      final parts = timeString.split(':');
      if (parts.length == 2) {
        final hour = int.tryParse(parts[0].trim());
        final minute = int.tryParse(parts[1].trim());
        if (hour != null && minute != null) {
          return TimeOfDay(hour: hour, minute: minute);
        }
      }
      return null;
    }

    DateTime convertToDateTime(TimeOfDay timeOfDay) {
      final now = DateTime.now();
      return DateTime(
          now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    }

    if (formdatabook!.validate()) {
      final fromTimeOfDay = parseTimeOfDay(fromTime.text);
      final toTimeOfDay = parseTimeOfDay(toTime.text);

      if (fromTimeOfDay != null && toTimeOfDay != null) {
        final fromDateTime = convertToDateTime(fromTimeOfDay);
        final toDateTime = convertToDateTime(toTimeOfDay);

        if (fromDateTime.isBefore(toDateTime)) {
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Invalid Time Range'),
                content: const Text('Please select a valid time range.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  void onInit() {
    noPeople = TextEditingController();
    destinationTo = TextEditingController();
    fromTime = TextEditingController();
    toTime = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    noPeople.dispose();
    destinationTo.dispose();
    fromTime.dispose();
    toTime.dispose();
    super.dispose();
  }

  Future sendemail() async {
    final number = noPeople.text;
    final destination = destinationTo.text;
    final from = fromTime.text;
    final phone = services.sharedPreferences.getString("phone") ?? '';
    final to = toTime.text;
    final Email email = Email(
      body:
          'Number Of People: $number \n Phone Number : $phone \n Destination: $destination \n From: $from \n To: $to',
      subject: 'Driver Request',
      recipients: ['alimandour5@gmail.com'],
    );
    await FlutterEmailSender.send(email);
  }
}
