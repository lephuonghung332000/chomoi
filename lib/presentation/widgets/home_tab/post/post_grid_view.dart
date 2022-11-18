import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/home_tab/post/post_vertical_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PostGridView extends StatelessWidget {
  final List<PostModel> posts;
  final Function(PostModel)? onTap;

  const PostGridView({Key? key, required this.posts, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: const BouncingScrollPhysics(),
      crossAxisSpacing: 0,
      itemCount: posts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => PostVerticalBox(
        viewModel: PostViewModel.fromPost(posts[index]),
        index: index,
        onTap: () {
          onTap?.call(posts[index]);
        },
      ),
      staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
      crossAxisCount: 2,
    );
  }
}
