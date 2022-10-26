import 'package:chomoi/data/dto/response/auth/logout_information_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_information_model.freezed.dart';

@freezed
class LogoutInformationModel with _$LogoutInformationModel {
  factory LogoutInformationModel() = _LogoutInformationModel;

  factory LogoutInformationModel.empty() => LogoutInformationModel(
  );

  factory LogoutInformationModel.fromDto(LogoutInformationDto dto) {
    return LogoutInformationModel(
    );
  }
}
