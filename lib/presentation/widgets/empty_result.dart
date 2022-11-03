import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:flutter/material.dart';

class EmptyResult extends StatelessWidget {
  const EmptyResult({Key? key, this.icon, this.message = ''}) : super(key: key);
  final Widget? icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null)
          Padding(padding: const EdgeInsets.only(bottom: 18), child: icon),
        if (message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              message,
              style: AppTextStyles.contentRegular15w400
                  .copyWith(color: AppColors.tertiaryTextColor),
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }
}
