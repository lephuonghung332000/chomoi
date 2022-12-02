// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserRequestModelTearOff {
  const _$UserRequestModelTearOff();

  _UserRequestModel call(
      {required String email,
      required String name,
      required String phone,
      required String birthday,
      required String fullname,
      required String address,
      required bool gender,
      MultipartFile? file}) {
    return _UserRequestModel(
      email: email,
      name: name,
      phone: phone,
      birthday: birthday,
      fullname: fullname,
      address: address,
      gender: gender,
      file: file,
    );
  }
}

/// @nodoc
const $UserRequestModel = _$UserRequestModelTearOff();

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
      _$UserRequestModelCopyWithImpl<$Res>;
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
class _$UserRequestModelCopyWithImpl<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  _$UserRequestModelCopyWithImpl(this._value, this._then);

  final UserRequestModel _value;
  // ignore: unused_field
  final $Res Function(UserRequestModel) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? birthday = freezed,
    Object? fullname = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? file = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
    ));
  }
}

/// @nodoc
abstract class _$UserRequestModelCopyWith<$Res>
    implements $UserRequestModelCopyWith<$Res> {
  factory _$UserRequestModelCopyWith(
          _UserRequestModel value, $Res Function(_UserRequestModel) then) =
      __$UserRequestModelCopyWithImpl<$Res>;
  @override
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
class __$UserRequestModelCopyWithImpl<$Res>
    extends _$UserRequestModelCopyWithImpl<$Res>
    implements _$UserRequestModelCopyWith<$Res> {
  __$UserRequestModelCopyWithImpl(
      _UserRequestModel _value, $Res Function(_UserRequestModel) _then)
      : super(_value, (v) => _then(v as _UserRequestModel));

  @override
  _UserRequestModel get _value => super._value as _UserRequestModel;

  @override
  $Res call({
    Object? email = freezed,
    Object? name = freezed,
    Object? phone = freezed,
    Object? birthday = freezed,
    Object? fullname = freezed,
    Object? address = freezed,
    Object? gender = freezed,
    Object? file = freezed,
  }) {
    return _then(_UserRequestModel(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthday: birthday == freezed
          ? _value.birthday
          : birthday // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: fullname == freezed
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      file: file == freezed
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
            other is _UserRequestModel &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.birthday, birthday) &&
            const DeepCollectionEquality().equals(other.fullname, fullname) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(birthday),
      const DeepCollectionEquality().hash(fullname),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$UserRequestModelCopyWith<_UserRequestModel> get copyWith =>
      __$UserRequestModelCopyWithImpl<_UserRequestModel>(this, _$identity);
}

abstract class _UserRequestModel implements UserRequestModel {
  factory _UserRequestModel(
      {required String email,
      required String name,
      required String phone,
      required String birthday,
      required String fullname,
      required String address,
      required bool gender,
      MultipartFile? file}) = _$_UserRequestModel;

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
  _$UserRequestModelCopyWith<_UserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
