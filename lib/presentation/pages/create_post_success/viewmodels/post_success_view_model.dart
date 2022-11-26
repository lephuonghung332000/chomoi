import 'dart:io';

import 'package:chomoi/app/util/int_extension.dart';
import 'package:chomoi/domain/models/request/post/post_request_model.dart';

class PostSuccessViewModel {
  final String title;
  final int price;
  final File image;

  PostSuccessViewModel({
    required this.title,
    required this.price,
    required this.image,
  });

  String get formattedPrice => price.currency.replaceAll('VND', 'đ') ?? '';

  factory PostSuccessViewModel.fromPost(
      PostRequestModel postRequestModel, File image) {
    return PostSuccessViewModel(
      title: postRequestModel.title,
      image: image,
      price: postRequestModel.price,
    );
  }
}
