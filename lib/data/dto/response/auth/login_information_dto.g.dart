// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInformationDto _$LoginInformationDtoFromJson(Map<String, dynamic> json) =>
    LoginInformationDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginInformationDtoToJson(
        LoginInformationDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      id: json['id'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
    };
