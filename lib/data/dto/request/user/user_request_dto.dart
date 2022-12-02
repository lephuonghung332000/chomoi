import 'package:chomoi/app/util/file_converter_serialize.dart';
import 'package:chomoi/domain/models/request/user/user_request_model.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request_dto.g.dart';

@JsonSerializable()
class UserRequestDto {
  final String email;
  final String name;
  final String phone;
  final String birthday;
  final String fullname;
  final String address;
  final bool gender;
  @FileConverterSerialize()
  final MultipartFile? file;

  UserRequestDto({
    required this.email,
    required this.name,
    required this.address,
    required this.phone,
    required this.birthday,
    required this.fullname,
    required this.gender,
    required this.file,
  });

  factory UserRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UserRequestDtoFromJson(json);

  factory UserRequestDto.fromModel(UserRequestModel model) {
    return UserRequestDto(
      email: model.email,
      name: model.name,
      address: model.address,
      phone: model.phone,
      birthday: model.birthday,
      fullname: model.fullname,
      gender: model.gender,
      file: model.file,
    );
  }

  Map<String, dynamic> toJson() => _$UserRequestDtoToJson(this);
}
