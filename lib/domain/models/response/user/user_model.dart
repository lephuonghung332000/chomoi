import 'package:chomoi/data/dto/response/user/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String address,
    required String avatar,
    required int birthday,
    required String email,
    required List<String> fcmTokens,
    required String fullName,
    required bool gender,
    required String name,
    required String phone,
    required String role,
  }) = _UserModel;

  factory UserModel.empty() => UserModel(
        id: '',
        address: '',
        avatar: '',
        birthday: -1,
        email: '',
        fcmTokens: [],
        fullName: '',
        gender: false,
        name: '',
        phone: '',
        role: '',
      );

  factory UserModel.fromDto(UserDto dto) {
    return UserModel(
      id: dto.data.id,
      address: dto.data.address,
      avatar: dto.data.avatar,
      birthday: dto.data.birthday,
      email: dto.data.email,
      fcmTokens: dto.data.fcmTokens,
      fullName: dto.data.fullName,
      gender: dto.data.gender,
      name: dto.data.name,
      phone: dto.data.phone,
      role: dto.data.role,
    );
  }
}
