import 'package:chomoi/domain/models/request/auth/sign_up_request_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_dto.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  final String email;
  final String password;
  final String name;
  final String phone;
  final bool gender;
  final String address;
  final String fullname;
  final String birthday;

  SignUpRequestDto({
    required this.name,
    required this.phone,
    required this.gender,
    required this.address,
    required this.fullname,
    required this.birthday,
    required this.email,
    required this.password,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDtoFromJson(json);

  factory SignUpRequestDto.fromModel(SignUpRequestModel model) {
    return SignUpRequestDto(
      email: model.email,
      password: model.password,
      name: model.name,
      phone: model.phone,
      gender: model.gender,
      address: model.address,
      fullname: model.fullname,
      birthday: model.birthday,
    );
  }

  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
}
