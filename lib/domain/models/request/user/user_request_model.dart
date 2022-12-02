import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request_model.freezed.dart';

@freezed
class UserRequestModel with _$UserRequestModel {
  factory UserRequestModel({
    required String email,
    required String name,
    required String phone,
    required String birthday,
    required String fullname,
    required String address,
    required bool gender,
    MultipartFile? file,
  }) = _UserRequestModel;

  factory UserRequestModel.empty() => UserRequestModel(
        email: '',
        name: '',
        phone: '',
        birthday: '',
        fullname: '',
        address: '',
        gender: true,
        file:null,
      );
}
