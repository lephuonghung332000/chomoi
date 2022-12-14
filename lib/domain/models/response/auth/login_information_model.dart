import 'package:chomoi/data/dto/response/auth/login_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_information_model.freezed.dart';

@freezed
class LoginInformationModel with _$LoginInformationModel {
  factory LoginInformationModel({
    required String idToken,
    required String userId,
  }) = _LoginInformationModel;

  factory LoginInformationModel.empty() =>
      LoginInformationModel(
          idToken: '',
          userId: ''
      );

  factory LoginInformationModel.fromDto(LoginInformationDto dto) {
    return LoginInformationModel(
      idToken: dto.data.token,
      userId: dto.data.id,
    );
  }
}
