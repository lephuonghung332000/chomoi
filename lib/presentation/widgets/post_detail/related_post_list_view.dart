import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/post_detail/related_post_box.dart';
import 'package:flutter/material.dart';

class RelatedPostListView extends StatelessWidget {
  final List<PostModel> posts;
  final Function(PostModel)? onTap;

  const RelatedPostListView({
    Key? key,
    required this.posts,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => RelatedPostBox(
        viewModel: PostViewModel.fromPost(posts[index]),
        index: index,
        onTap: () {
          onTap?.call(posts[index]);
        },
      ),
      itemCount: posts.length,
    );
  }
}
