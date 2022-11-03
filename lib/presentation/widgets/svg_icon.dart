// Flutter imports:
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;

  const SvgIcon({
    required this.icon,
    this.size = AppConstant.iconSize,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: size ?? width,
      height: size ?? height,
      color: color,
      fit: fit,
    );
  }
}
