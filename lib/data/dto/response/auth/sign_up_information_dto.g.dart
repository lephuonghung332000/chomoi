// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpInformationDto _$SignUpInformationDtoFromJson(
        Map<String, dynamic> json) =>
    SignUpInformationDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$SignUpInformationDtoToJson(
        SignUpInformationDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
