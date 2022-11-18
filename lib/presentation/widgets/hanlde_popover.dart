// Flutter imports:
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HandlePopover extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets? padding;
  final BorderRadius borderRadius;
  final List<BoxShadow>? boxShadow;
  final double height;

  const HandlePopover({
    Key? key,
    required this.child,
    this.margin = const EdgeInsets.all(16),
    this.padding,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.boxShadow,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: margin,
      height: height,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}
