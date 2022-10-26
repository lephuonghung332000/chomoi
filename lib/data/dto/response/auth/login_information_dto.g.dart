// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInformationDto _$LoginInformationDtoFromJson(Map<String, dynamic> json) =>
    LoginInformationDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$LoginInformationDtoToJson(
        LoginInformationDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
