import 'package:chomoi/presentation/widgets/custom_cupertino_picker.dart';
import 'package:flutter/cupertino.dart';

import 'input_field.dart';

class CupertinoPickerField<T> extends StatelessWidget {
  final String placeHolder;
  final List<T> items;
  final ValueChanged<T?>? onSelected;
  final T? selectedValue;
  final TextEditingController controller;
  final bool canSelected;
  final Widget? suffixIcon;

  const CupertinoPickerField({
    Key? key,
    required this.placeHolder,
    required this.items,
    this.selectedValue,
    this.onSelected,
    required this.controller,
    this.canSelected = true,
    this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      placeholder: placeHolder,
      readOnly: true,
      onTap: canSelected ? () => _showCupertinoPicker(context) : null,
      suffixIcon: suffixIcon,
    );
  }

  void _showCupertinoPicker(BuildContext context) {
    CustomCupertinoPicker.show(
      context,
      selectedValue: selectedValue,
      items: items,
    ).then((value) {
      if (value != null) {
        controller.text = value.toString();
        onSelected?.call(value);
      }
    });
  }
}
