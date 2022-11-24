

import 'dart:io';
import 'dart:ui';

import 'package:chomoi/app/config/resources/app_colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_request_model.freezed.dart';

@freezed
class PostRequestModel with _$PostRequestModel {
  factory PostRequestModel({
    required String title,
    required String brandId,
    required String address,
    required int price,
    required String categoryId,
    required String userId,
    required String description,
    required List<File?> file,
  }) = _PostRequestModel;

  factory PostRequestModel.empty() => PostRequestModel(
        title: '',
        userId: '',
        brandId: '',
        address: '',
        price: 0,
        categoryId: '',
        description: '',
        file: [],
      );
}
