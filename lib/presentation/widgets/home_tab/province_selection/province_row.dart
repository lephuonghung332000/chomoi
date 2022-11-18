import 'package:chomoi/app/config/resources/app_assets.dart';
import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:chomoi/presentation/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class ProvinceRow extends StatelessWidget {
  final ValueChanged<int>? onChange;
  final int index;
  final int groupValue;
  final String province;

  const ProvinceRow({
    Key? key,
    this.onChange,
    required this.index,
    required this.groupValue,
    required this.province,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: RadioListTile(
        value: index,
        groupValue: groupValue,
        onChanged: (index) {
          onChange?.call(index as int);
        },
        activeColor: AppColors.primaryColor,
        title: Text(province),
        secondary: const SvgIcon(
          icon: AppAssets.iconArrowRight,
          size: 10,
          color: AppColors.greyStorm,
        ),
      ),
    );
  }
}
