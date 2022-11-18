import 'package:chomoi/domain/models/response/post/post_model.dart';
import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/my_post_tab/my_post/my_post_row.dart';
import 'package:flutter/material.dart';

class MyPostListView extends StatelessWidget {
  final List<PostModel> posts;
  final Function(PostModel)? onTap;
  final bool isReject;

  const MyPostListView({
    Key? key,
    required this.posts,
    this.onTap,
    this.isReject = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => MyPostRow(
        viewModel: PostViewModel.fromPost(posts[index]),
        isReject: isReject,
        onTap: () {
          onTap?.call(posts[index]);
        },
      ),
      itemCount: posts.length,
    );
  }
}
