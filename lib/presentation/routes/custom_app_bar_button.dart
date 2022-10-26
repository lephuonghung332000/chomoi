import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBarButton extends StatelessWidget {
  final String? title;
  final EdgeInsets padding;
  final bool isLoading;
  final VoidCallback? onPressed;

  const CustomAppBarButton({
    Key? key,
    this.title,
    this.padding = const EdgeInsets.all(8),
    this.isLoading = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed != null
          ? () {
              if (!isLoading) {
                onPressed?.call();
              }
            }
          : null,
      padding: padding,
      child: isLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CupertinoActivityIndicator(),
            )
          : Text(
              title ?? '',
              style: TextStyle(
                color: onPressed != null
                    ? AppColors.primaryColor
                    : AppColors.disabledColor,
              ),
            ),
    );
  }
}
