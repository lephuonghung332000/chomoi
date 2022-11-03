import 'package:chomoi/domain/models/response/category/category_model.dart';
import 'package:chomoi/presentation/widgets/home/category_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoryGridView extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      crossAxisSpacing: 12,
      crossAxisCount: 4,
      itemCount: categories.length,
      itemBuilder: (context, index) => CategoryBox(
        categoryModel: categories[index],
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
    );
  }
}
