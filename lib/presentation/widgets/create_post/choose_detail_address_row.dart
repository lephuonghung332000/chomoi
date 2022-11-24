
import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/presentation/widgets/ink_well_container.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class ChooseDetailAddressRow extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final bool isSelected;
  final String name;

  const ChooseDetailAddressRow({
    Key? key,
    required this.name,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWellContainer(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: theme.dividerColor,
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name),
            if (isSelected)
              const SvgIcon(
                icon: AppAssets.iconChecked,
                size: 10,
              )
          ],
        ),
      ),
    );
  }
}
