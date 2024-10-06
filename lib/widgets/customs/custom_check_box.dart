import 'package:alrehila/tools/design/color_panel.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?>? onChanged;

  const CustomCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value = !value;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: value ? Colors.white : Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
          color: value ? AppColor.primary : Colors.transparent,
          boxShadow: value
              ? [
                  BoxShadow(
                    color: AppColor.primary.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ]
              : [],
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          widget.title,
          style: TextStyle(
            color: value ? AppColor.white : AppColor.primary,
          ),
        ),
      ),
    );
  }
}
