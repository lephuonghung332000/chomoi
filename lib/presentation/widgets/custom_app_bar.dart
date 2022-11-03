import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/widgets/app_back_button.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends CupertinoNavigationBar {
  CustomAppBar({
    Key? key,
    String? title,
    String? subTitle,
    Widget? leading,
    List<Widget> actions = const [],
    Color? background = AppColors.white,
  }) : super(
          padding: const EdgeInsetsDirectional.only(start: 0, end: 8),
          key: key,
          automaticallyImplyLeading: false,
          backgroundColor: background,
          leading: leading ?? const AppBackButton(),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: actions,
          ),
          middle: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null)
                Text(
                  title,
                  style: const TextStyle(color: AppColors.primaryTextColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              if (subTitle != null)
                Text(
                  subTitle,
                  style: AppTextStyles.infoRegular13w400,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        );
}
