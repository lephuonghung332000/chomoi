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
      data: SignUpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpInformationDtoToJson(
        SignUpInformationDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

SignUpData _$SignUpDataFromJson(Map<String, dynamic> json) => SignUpData(
      id: json['id'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignUpDataToJson(SignUpData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
