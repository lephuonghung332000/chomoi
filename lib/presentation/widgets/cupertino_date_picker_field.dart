import 'package:chomoi/app/util/date_formats.dart';
import 'package:chomoi/presentation/widgets/custom_cupertino_date_picker.dart';
import 'package:flutter/material.dart';
import 'input_field.dart';

class CupertinoDatePickerField extends StatelessWidget {
  final String placeHolder;
  final ValueChanged<DateTime>? onSelected;
  final DateTime? selectedDate;
  final TextEditingController controller;
  final InputDecoration? decoration;

  const CupertinoDatePickerField({
    Key? key,
    this.placeHolder = '',
    this.selectedDate,
    this.onSelected,
    this.decoration,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      placeholder: placeHolder,
      readOnly: true,
      onTap: () => _showCupertinoDatePicker(context),
      decoration: decoration,
    );
  }

  void _showCupertinoDatePicker(BuildContext context) {
    CustomCupertinoDatePicker.show(
      context,
      selectedDate: selectedDate,
    ).then((value) {
      if (value != null) {
        controller.text =
            value.localTimeZoneString(DateFormatEnum.dayMonthYear);
        onSelected?.call(value);
      }
    });
  }
}
