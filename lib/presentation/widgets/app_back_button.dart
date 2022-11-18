import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/cupertino.dart';

class AppBackButton extends StatelessWidget {
  final String? title;
  final VoidCallback? onBack;
  final Widget icon;
  final EdgeInsetsGeometry padding;

  const AppBackButton(
      {Key? key,
      this.title,
      this.icon = const SvgIcon(
        size: 20,
        icon: AppAssets.iconBack,
      ),
      this.padding = const EdgeInsets.symmetric(horizontal: 16),
      this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding,
      onPressed: onBack ?? () => Navigator.of(context).pop(),
      child: icon,
    );
  }
}
