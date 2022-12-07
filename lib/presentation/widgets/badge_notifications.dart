import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';

class BadgeNotifications extends StatelessWidget {
  const BadgeNotifications({
    Key? key,
    required this.child,
    required this.count,
  }) : super(key: key);

  final Widget child;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: count > 0,
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: BadgeShape.square,
      badgeColor: AppColors.red,
      animationType: BadgeAnimationType.fade,
      borderRadius: BorderRadius.circular(9),
      badgeContent: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        constraints: const BoxConstraints(
          minWidth: 18,
          minHeight: 18,
        ),
        child: Center(
          child: Text(
            count <= 999 ? '$count' : '999+',
            style: AppTextStyles.commandBold9w700.copyWith(
              color: AppColors.white,
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
