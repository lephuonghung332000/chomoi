// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as String,
      address: json['address'] as String,
      avatar: json['avatar'] as String,
      birthday: json['birthday'] as int,
      email: json['email'] as String,
      fcmTokens:
          (json['fcmTokens'] as List<dynamic>).map((e) => e as String).toList(),
      fullName: json['fullname'] as String,
      gender: json['gender'] as bool,
      name: json['name'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'avatar': instance.avatar,
      'birthday': instance.birthday,
      'email': instance.email,
      'fcmTokens': instance.fcmTokens,
      'fullname': instance.fullName,
      'gender': instance.gender,
      'name': instance.name,
      'phone': instance.phone,
      'role': instance.role,
    };
