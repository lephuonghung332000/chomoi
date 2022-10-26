// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpRequestModelTearOff {
  const _$SignUpRequestModelTearOff();

  _SignUpRequestModel call(
      {required String name,
      required String phone,
      required bool gender,
      required String address,
      required String fullName,
      required String birthDay,
      required String email,
      required String password}) {
    return _SignUpRequestModel(
      name: name,
      phone: phone,
      gender: gender,
      address: address,
      fullName: fullName,
      birthDay: birthDay,
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $SignUpRequestModel = _$SignUpRequestModelTearOff();

/// @nodoc
mixin _$SignUpRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get gender => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get birthDay => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpRequestModelCopyWith<SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpRequestModelCopyWith<$Res> {
  factory $SignUpRequestModelCopyWith(
          SignUpRequestModel value, $Res Function(SignUpRequestModel) then) =
      _$SignUpRequestModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String phone,
      bool gender,
      String address,
      String fullName,
      String birthDay,
      String email,
      String password});
}

/// @nodoc
class _$SignUpRequestModelCopyWithImpl<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  _$SignUpRequestModelCopyWithImpl(this._value, this._then);

  final SignUpRequestModel _value;
  // ignore: unused_field
  final $Res Function(SignUpRequestModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? fullName = freezed,
    Object? birthDay = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignUpRequestModelCopyWith<$Res>
    implements $SignUpRequestModelCopyWith<$Res> {
  factory _$SignUpRequestModelCopyWith(
          _SignUpRequestModel value, $Res Function(_SignUpRequestModel) then) =
      __$SignUpRequestModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String phone,
      bool gender,
      String address,
      String fullName,
      String birthDay,
      String email,
      String password});
}

/// @nodoc
class __$SignUpRequestModelCopyWithImpl<$Res>
    extends _$SignUpRequestModelCopyWithImpl<$Res>
    implements _$SignUpRequestModelCopyWith<$Res> {
  __$SignUpRequestModelCopyWithImpl(
      _SignUpRequestModel _value, $Res Function(_SignUpRequestModel) _then)
      : super(_value, (v) => _then(v as _SignUpRequestModel));

  @override
  _SignUpRequestModel get _value => super._value as _SignUpRequestModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? address = freezed,
    Object? fullName = freezed,
    Object? birthDay = freezed,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignUpRequestModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: fullName == freezed
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpRequestModel implements _SignUpRequestModel {
  _$_SignUpRequestModel(
      {required this.name,
      required this.phone,
      required this.gender,
      required this.address,
      required this.fullName,
      required this.birthDay,
      required this.email,
      required this.password});

  @override
  final String name;
  @override
  final String phone;
  @override
  final bool gender;
  @override
  final String address;
  @override
  final String fullName;
  @override
  final String birthDay;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpRequestModel(name: $name, phone: $phone, gender: $gender, address: $address, fullName: $fullName, birthDay: $birthDay, email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpRequestModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.fullName, fullName) &&
            const DeepCollectionEquality().equals(other.birthDay, birthDay) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(fullName),
      const DeepCollectionEquality().hash(birthDay),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$SignUpRequestModelCopyWith<_SignUpRequestModel> get copyWith =>
      __$SignUpRequestModelCopyWithImpl<_SignUpRequestModel>(this, _$identity);
}

abstract class _SignUpRequestModel implements SignUpRequestModel {
  factory _SignUpRequestModel(
      {required String name,
      required String phone,
      required bool gender,
      required String address,
      required String fullName,
      required String birthDay,
      required String email,
      required String password}) = _$_SignUpRequestModel;

  @override
  String get name;
  @override
  String get phone;
  @override
  bool get gender;
  @override
  String get address;
  @override
  String get fullName;
  @override
  String get birthDay;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$SignUpRequestModelCopyWith<_SignUpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
