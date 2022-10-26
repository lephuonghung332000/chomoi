import 'package:flutter/cupertino.dart';

class CustomCupertinoPickerItem<T> extends StatelessWidget {
  final T value;
  final String text;

  const CustomCupertinoPickerItem(
      {Key? key, required this.value, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
