// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginRequestModelTearOff {
  const _$LoginRequestModelTearOff();

  _LoginRequestModel call({required String email, required String password}) {
    return _LoginRequestModel(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $LoginRequestModel = _$LoginRequestModelTearOff();

/// @nodoc
mixin _$LoginRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginRequestModelCopyWith<LoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginRequestModelCopyWith<$Res> {
  factory $LoginRequestModelCopyWith(
          LoginRequestModel value, $Res Function(LoginRequestModel) then) =
      _$LoginRequestModelCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginRequestModelCopyWithImpl<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  _$LoginRequestModelCopyWithImpl(this._value, this._then);

  final LoginRequestModel _value;
  // ignore: unused_field
  final $Res Function(LoginRequestModel) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
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
abstract class _$LoginRequestModelCopyWith<$Res>
    implements $LoginRequestModelCopyWith<$Res> {
  factory _$LoginRequestModelCopyWith(
          _LoginRequestModel value, $Res Function(_LoginRequestModel) then) =
      __$LoginRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$LoginRequestModelCopyWithImpl<$Res>
    extends _$LoginRequestModelCopyWithImpl<$Res>
    implements _$LoginRequestModelCopyWith<$Res> {
  __$LoginRequestModelCopyWithImpl(
      _LoginRequestModel _value, $Res Function(_LoginRequestModel) _then)
      : super(_value, (v) => _then(v as _LoginRequestModel));

  @override
  _LoginRequestModel get _value => super._value as _LoginRequestModel;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_LoginRequestModel(
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

class _$_LoginRequestModel implements _LoginRequestModel {
  _$_LoginRequestModel({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginRequestModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginRequestModel &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$LoginRequestModelCopyWith<_LoginRequestModel> get copyWith =>
      __$LoginRequestModelCopyWithImpl<_LoginRequestModel>(this, _$identity);
}

abstract class _LoginRequestModel implements LoginRequestModel {
  factory _LoginRequestModel(
      {required String email, required String password}) = _$_LoginRequestModel;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$LoginRequestModelCopyWith<_LoginRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
