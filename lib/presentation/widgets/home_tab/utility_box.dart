import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/presentation/controllers/home_tab/home/home_controller.dart';
import 'package:flutter/material.dart';

class UtilityBox extends StatelessWidget {
  final VoidCallback? onPress;
  final SelectedBox selectBox;

  const UtilityBox({Key? key, this.onPress, required this.selectBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstant.boxItemSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: CachedNetworkImage(imageUrl: selectBox.iconLink),
            padding: const EdgeInsets.all(6),
            onPressed: onPress,
          ),
          Text(
            selectBox.title,
            style: AppTextStyles.smallRegular11w400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
