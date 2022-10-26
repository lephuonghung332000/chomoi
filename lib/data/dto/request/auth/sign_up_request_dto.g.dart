// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestDto _$SignUpRequestDtoFromJson(Map<String, dynamic> json) =>
    SignUpRequestDto(
      name: json['name'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as bool,
      address: json['address'] as String,
      fullName: json['fullName'] as String,
      birthDay: json['birthDay'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignUpRequestDtoToJson(SignUpRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'gender': instance.gender,
      'address': instance.address,
      'fullName': instance.fullName,
      'birthDay': instance.birthDay,
    };
