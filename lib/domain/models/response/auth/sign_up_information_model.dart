import 'package:chomoi/data/dto/response/auth/sign_up_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_information_model.freezed.dart';

@freezed
class SignUpInformationModel with _$SignUpInformationModel {
  factory SignUpInformationModel({
    required String idToken,
  }) = _SignUpInformationModel;

  factory SignUpInformationModel.empty() => SignUpInformationModel(
    idToken: '',
  );

  factory SignUpInformationModel.fromDto(SignUpInformationDto dto) {
    return SignUpInformationModel(
      idToken: dto.data
    );
  }
}
