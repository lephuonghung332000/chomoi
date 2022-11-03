import 'dart:math';
import 'package:chomoi/app/config/constant/app_strings.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/widgets/custom_app_bar_button.dart';
import 'package:chomoi/presentation/widgets/custom_cupertino_picker_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CustomCupertinoPicker<T> extends StatefulWidget {
  final T? selectedValue;
  final List<T> values;

  const CustomCupertinoPicker({
    Key? key,
    this.selectedValue,
    required this.values,
  }) : super(key: key);

  static Future<T?> show<T>(BuildContext context,
      {T? selectedValue, required List<T> items}) {
    assert(items.isNotEmpty);

    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CustomCupertinoPicker<T>(
          selectedValue: selectedValue,
          values: items,
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() => _CustomCupertinoPickerState<T>();
}

class _CustomCupertinoPickerState<T> extends State<CustomCupertinoPicker<T>> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    if (widget.selectedValue != null) {
      final index = widget.values
          .indexWhere((element) => element == widget.selectedValue);

      if (index >= 0) {
        _currentIndex = index;
      }
    }
  }

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
                  final value = widget.values[_currentIndex];

                  Navigator.of(context).pop(value);
                },
                padding: const EdgeInsets.all(16),
              )
            ],
          ),
        ),
        Container(
          height: min(Get.height * 0.36, 320),
          child: CupertinoPicker(
            backgroundColor: AppColors.white,
            magnification: 1.2,
            itemExtent: 40,
            scrollController:
                FixedExtentScrollController(initialItem: _currentIndex),
            children: widget.values
                .map(
                  (e) => CustomCupertinoPickerItem(
                    value: e,
                    text: e.toString(),
                  ),
                )
                .toList(),
            onSelectedItemChanged: (value) {
              _currentIndex = value;
            },
          ),
        )
      ],
    );
  }
}
