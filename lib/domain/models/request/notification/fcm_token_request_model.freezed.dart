// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fcm_token_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FcmTokenRequestModelTearOff {
  const _$FcmTokenRequestModelTearOff();

  _FcmTokenRequestModel call({required String token}) {
    return _FcmTokenRequestModel(
      token: token,
    );
  }
}

/// @nodoc
const $FcmTokenRequestModel = _$FcmTokenRequestModelTearOff();

/// @nodoc
mixin _$FcmTokenRequestModel {
  String get token => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FcmTokenRequestModelCopyWith<FcmTokenRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmTokenRequestModelCopyWith<$Res> {
  factory $FcmTokenRequestModelCopyWith(FcmTokenRequestModel value,
          $Res Function(FcmTokenRequestModel) then) =
      _$FcmTokenRequestModelCopyWithImpl<$Res>;
  $Res call({String token});
}

/// @nodoc
class _$FcmTokenRequestModelCopyWithImpl<$Res>
    implements $FcmTokenRequestModelCopyWith<$Res> {
  _$FcmTokenRequestModelCopyWithImpl(this._value, this._then);

  final FcmTokenRequestModel _value;
  // ignore: unused_field
  final $Res Function(FcmTokenRequestModel) _then;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FcmTokenRequestModelCopyWith<$Res>
    implements $FcmTokenRequestModelCopyWith<$Res> {
  factory _$FcmTokenRequestModelCopyWith(_FcmTokenRequestModel value,
          $Res Function(_FcmTokenRequestModel) then) =
      __$FcmTokenRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String token});
}

/// @nodoc
class __$FcmTokenRequestModelCopyWithImpl<$Res>
    extends _$FcmTokenRequestModelCopyWithImpl<$Res>
    implements _$FcmTokenRequestModelCopyWith<$Res> {
  __$FcmTokenRequestModelCopyWithImpl(
      _FcmTokenRequestModel _value, $Res Function(_FcmTokenRequestModel) _then)
      : super(_value, (v) => _then(v as _FcmTokenRequestModel));

  @override
  _FcmTokenRequestModel get _value => super._value as _FcmTokenRequestModel;

  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_FcmTokenRequestModel(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FcmTokenRequestModel implements _FcmTokenRequestModel {
  _$_FcmTokenRequestModel({required this.token});

  @override
  final String token;

  @override
  String toString() {
    return 'FcmTokenRequestModel(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FcmTokenRequestModel &&
            const DeepCollectionEquality().equals(other.token, token));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(token));

  @JsonKey(ignore: true)
  @override
  _$FcmTokenRequestModelCopyWith<_FcmTokenRequestModel> get copyWith =>
      __$FcmTokenRequestModelCopyWithImpl<_FcmTokenRequestModel>(
          this, _$identity);
}

abstract class _FcmTokenRequestModel implements FcmTokenRequestModel {
  factory _FcmTokenRequestModel({required String token}) =
      _$_FcmTokenRequestModel;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$FcmTokenRequestModelCopyWith<_FcmTokenRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
