
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImagePost extends StatelessWidget {
  final String image;

  const ImagePost({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: double.infinity,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) =>
      const CupertinoActivityIndicator(),
      placeholder: (context, url) => const CupertinoActivityIndicator(),
    );
  }
}
