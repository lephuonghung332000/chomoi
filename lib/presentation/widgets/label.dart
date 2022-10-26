import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String text;
  final Color color;
  final double? size;
  final FontWeight weight;
  final FontStyle fontStyle;
  final TextAlign? align;
  final int? maxLines;
  final TextOverflow? overflow;
  final GestureTapCallback? onTap;

  const Label({
    Key? key,
    required this.text,
    this.color = AppColors.primaryTextColor,
    this.size,
    this.weight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.align,
    this.maxLines,
    this.overflow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: align,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontStyle: fontStyle,
      ),
    );
  }
}
