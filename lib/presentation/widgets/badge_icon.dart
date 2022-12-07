// Flutter imports:
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

class BadgeIcon extends StatelessWidget {
  final Widget icon;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final double minSize;
  final bool isLoading;

  const BadgeIcon(
      {Key? key,
      this.minSize = 34,
      required this.icon,
      this.backgroundColor = AppColors.primaryColor,
      this.padding,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: padding ?? EdgeInsets.symmetric(horizontal: minSize * 0.3),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(minSize / 2),
          ),
          constraints: BoxConstraints(minHeight: minSize, minWidth: minSize),
          child: Center(
            child: isLoading ? null : icon,
          ),
        ),
        if (isLoading)
          const CupertinoActivityIndicator(
            color: AppColors.white,
          )
      ],
    );
  }
}
