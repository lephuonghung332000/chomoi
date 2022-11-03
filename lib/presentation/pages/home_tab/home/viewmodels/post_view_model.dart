import 'package:chomoi/app/util/int_extension.dart';
import 'package:chomoi/domain/models/response/post/post_model.dart';

class PostViewModel {
  final String? title;
  final List<String>? image;
  final int? price;
  final String? avatarUrl;
  final String? address;

  PostViewModel({
    this.title,
    this.image,
    this.price,
    this.avatarUrl,
    this.address,
  });

  String get formattedPrice => price?.currency ?? '';

  String? get firstImage => image?.first;

  String? get province => address?.split(',')[2] ?? '';

  factory PostViewModel.fromPost(PostModel postModel) {
    return PostViewModel(
      title: postModel.title,
      image: postModel.images,
      price: postModel.price,
      address: postModel.address,
      avatarUrl: postModel.avatar,
    );
  }
}
