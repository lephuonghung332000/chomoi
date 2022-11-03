import 'package:chomoi/presentation/pages/home_tab/home/viewmodels/post_view_model.dart';
import 'package:chomoi/presentation/widgets/vbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostVerticalBox extends StatelessWidget {
  final VoidCallback? onPress;
  final PostViewModel viewModel;

  const PostVerticalBox({
    Key? key,
    this.onPress,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 2,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Image.network(''),
            const VBox(2),
          ],
        ),
      ),
    );
  }
}
