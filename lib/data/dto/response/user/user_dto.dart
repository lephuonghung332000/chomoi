import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  UserDto({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool success;
  final String message;
  final UserData data;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class UserData {
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  UserData({
    required this.id,
    required this.address,
    required this.avatar,
    required this.birthday,
    required this.email,
    required this.fcmTokens,
    required this.fullName,
    required this.gender,
    required this.name,
    required this.phone,
    required this.role,
  });

  final String id;
  final String address;
  final String avatar;
  final int birthday;
  final String email;
  final List<String> fcmTokens;
  @JsonKey(name: 'fullname')
  final String fullName;
  final bool gender;
  final String name;
  final String phone;
  final String role;

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
