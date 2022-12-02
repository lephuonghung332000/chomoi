// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestDto _$UserRequestDtoFromJson(Map<String, dynamic> json) =>
    UserRequestDto(
      email: json['email'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      birthday: json['birthday'] as String,
      fullname: json['fullname'] as String,
      gender: json['gender'] as bool,
      file: _$JsonConverterFromJson<MultipartFile, MultipartFile>(
          json['file'], const FileConverterSerialize().fromJson),
    );

Map<String, dynamic> _$UserRequestDtoToJson(UserRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'fullname': instance.fullname,
      'address': instance.address,
      'gender': instance.gender,
      'file': _$JsonConverterToJson<MultipartFile, MultipartFile>(
          instance.file, const FileConverterSerialize().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
