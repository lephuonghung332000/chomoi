import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/home_tab/post/post_horizontal_box.dart';
import 'package:flutter/material.dart';

class PostListView extends StatelessWidget {
  final List<PostModel> posts;
  final Function(PostModel)? onTap;

  const PostListView({Key? key, required this.posts,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => PostHorizontalBox(
          viewModel: PostViewModel.fromPost(posts[index]), index: index),
      itemCount: posts.length,
    );
  }
}
