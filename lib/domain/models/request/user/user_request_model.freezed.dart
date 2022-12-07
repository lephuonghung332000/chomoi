// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get birthday => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get gender => throw _privateConstructorUsedError;
  MultipartFile? get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRequestModelCopyWith<UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRequestModelCopyWith<$Res> {
  factory $UserRequestModelCopyWith(
          UserRequestModel value, $Res Function(UserRequestModel) then) =
      _$UserRequestModelCopyWithImpl<$Res, UserRequestModel>;
  @useResult
  $Res call(
      {String email,
      String name,
      String phone,
      String birthday,
      String fullname,
      String address,
      bool gender,
      MultipartFile? file});
}

/// @nodoc
class _$UserRequestModelCopyWithImpl<$Res, $Val extends UserRequestModel>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? birthday = null,
    Object? fullname = null,
    Object? address = null,
    Object? gender = null,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserRequestModelCopyWith<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  factory _$$_UserRequestModelCopyWith(
          _$_UserRequestModel value, $Res Function(_$_UserRequestModel) then) =
      __$$_UserRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String name,
      String phone,
      String birthday,
      String fullname,
      String address,
      bool gender,
      MultipartFile? file});
}

/// @nodoc
class __$$_UserRequestModelCopyWithImpl<$Res>
    extends _$UserRequestModelCopyWithImpl<$Res, _$_UserRequestModel>
    implements _$$_UserRequestModelCopyWith<$Res> {
  __$$_UserRequestModelCopyWithImpl(
      _$_UserRequestModel _value, $Res Function(_$_UserRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? name = null,
    Object? phone = null,
    Object? birthday = null,
    Object? fullname = null,
    Object? address = null,
    Object? gender = null,
    Object? file = freezed,
  }) {
    return _then(_$_UserRequestModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: null == birthday
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
    ));
  }
}

/// @nodoc

class _$_UserRequestModel implements _UserRequestModel {
  _$_UserRequestModel(
      {required this.email,
      required this.name,
      required this.phone,
      required this.birthday,
      required this.fullname,
      required this.address,
      required this.gender,
      this.file});

  @override
  final String email;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String birthday;
  @override
  final String fullname;
  @override
  final String address;
  @override
  final bool gender;
  @override
  final MultipartFile? file;

  @override
  String toString() {
    return 'UserRequestModel(email: $email, name: $name, phone: $phone, birthday: $birthday, fullname: $fullname, address: $address, gender: $gender, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.birthday, birthday) ||
                other.birthday == birthday) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, name, phone, birthday,
      fullname, address, gender, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserRequestModelCopyWith<_$_UserRequestModel> get copyWith =>
      __$$_UserRequestModelCopyWithImpl<_$_UserRequestModel>(this, _$identity);
}

abstract class _UserRequestModel implements UserRequestModel {
  factory _UserRequestModel(
      {required final String email,
      required final String name,
      required final String phone,
      required final String birthday,
      required final String fullname,
      required final String address,
      required final bool gender,
      final MultipartFile? file}) = _$_UserRequestModel;

  @override
  String get email;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get birthday;
  @override
  String get fullname;
  @override
  String get address;
  @override
  bool get gender;
  @override
  MultipartFile? get file;
  @override
  @JsonKey(ignore: true)
  _$$_UserRequestModelCopyWith<_$_UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
