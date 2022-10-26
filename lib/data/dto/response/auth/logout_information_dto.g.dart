// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutInformationDto _$LogoutInformationDtoFromJson(
        Map<String, dynamic> json) =>
    LogoutInformationDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$LogoutInformationDtoToJson(
        LogoutInformationDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
