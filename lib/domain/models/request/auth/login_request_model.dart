import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_model.freezed.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  factory LoginRequestModel({
    required String email,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.empty() => LoginRequestModel(
    email: '',
    password: '',
  );
}
