import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppActivityIndicator extends StatelessWidget {
  final Color color;
  final bool isAnimating;
  final double size;

  const AppActivityIndicator({
    Key? key,
    this.color = AppColors.primaryColor,
    this.isAnimating = true,
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActivityIndicator(
      color: color,
      animating: isAnimating,
      radius: size,
    );
  }
}
