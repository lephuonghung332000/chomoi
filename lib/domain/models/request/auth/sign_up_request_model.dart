import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_request_model.freezed.dart';

@freezed
class SignUpRequestModel with _$SignUpRequestModel {
  factory SignUpRequestModel({
    required String name,
    required String phone,
    required bool gender,
    required String address,
    required String fullName,
    required String birthDay,
    required String email,
    required String password,
  }) = _SignUpRequestModel;

  factory SignUpRequestModel.empty() => SignUpRequestModel(
        name: '',
        phone: '',
        gender: false,
        address: '',
        fullName: '',
        birthDay: '',
        email: '',
        password: '',
      );
}
