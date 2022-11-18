import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/material.dart';

class InkWellContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  const InkWellContainer({
    Key? key,
    required this.child,
    this.onTap,
    this.backgroundColor = AppColors.primaryContrastColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(0)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: backgroundColor,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
