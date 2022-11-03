import 'dart:math';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomCupertinoDatePicker extends StatefulWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime>? onSelected;

  const CustomCupertinoDatePicker({
    Key? key,
    this.selectedDate,
    this.onSelected,
  }) : super(key: key);

  static Future<DateTime?> show(BuildContext context,
      {DateTime? selectedDate, ValueChanged<DateTime>? onSelected}) {
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CustomCupertinoDatePicker(
          selectedDate: selectedDate,
          onSelected: onSelected,
        );
      },
    );
  }

  @override
  State<CustomCupertinoDatePicker> createState() =>
      _CustomCupertinoDatePickerState();
}

class _CustomCupertinoDatePickerState extends State<CustomCupertinoDatePicker> {
  DateTime _current = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: AppColors.secondaryBackgroundColor,
            border: Border(
              bottom: BorderSide(
                color: AppColors.separatorColor,
                width: 0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomAppBarButton(
                title: AppStrings.button_cancel,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding: const EdgeInsets.all(16),
              ),
              CustomAppBarButton(
                title: AppStrings.button_select,
                onPressed: () {
                  Navigator.of(context).pop(_current);
                },
                padding: const EdgeInsets.all(16),
              )
            ],
          ),
        ),
        Container(
          height: min(Get.height * 0.36, 320),
          child: CupertinoDatePicker(
            initialDateTime: widget.selectedDate,
            backgroundColor: AppColors.white,
            maximumYear: DateTime.now().year,
            minimumYear: DateTime.now().year - 100,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (value) {
              widget.onSelected?.call(value);
              _current = value;
            },
          ),
        )
      ],
    );
  }
}
