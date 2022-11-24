import 'package:cached_network_image/cached_network_image.dart';
import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/app/config/resources/app_textstyles.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final VoidCallback? onPress;
  final CategoryModel categoryModel;

  const CategoryBox({
    Key? key,
    this.onPress,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstant.boxItemSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: CachedNetworkImage(
              imageUrl: categoryModel.thumbnail,
              errorWidget: (context, url, error) => const CupertinoActivityIndicator(),
              placeholder: (context, url) => const CupertinoActivityIndicator(),
            ),
            padding: const EdgeInsets.all(6),
            onPressed: onPress,
            iconSize: AppConstant.boxItemSize,
          ),
          Text(
            categoryModel.name,
            style: AppTextStyles.smallRegular11w400,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
