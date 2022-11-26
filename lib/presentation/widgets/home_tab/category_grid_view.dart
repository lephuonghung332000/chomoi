import 'package:chomoi/app/config/constant/app_constants.dart';
import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/presentation/controllers/home_tab/home/home_controller.dart';
import 'package:chomoi/presentation/widgets/home_tab/category_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CategoryGridView extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstant.heightCategoryView,
      child: StaggeredGridView.countBuilder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        crossAxisSpacing: 12,
        crossAxisCount: 4,
        itemCount: categories.length,
        itemBuilder: (context, index) => CategoryBox(
          categoryModel: categories[index],
          onPress: () => Get.find<HomeController>()
              .routeToPostPage(category: categories[index]),
        ),
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      ),
    );
  }
}
