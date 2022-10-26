// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginInformationModelTearOff {
  const _$LoginInformationModelTearOff();

  _LoginInformationModel call({required String idToken}) {
    return _LoginInformationModel(
      idToken: idToken,
    );
  }
}

/// @nodoc
const $LoginInformationModel = _$LoginInformationModelTearOff();

/// @nodoc
mixin _$LoginInformationModel {
  String get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginInformationModelCopyWith<LoginInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInformationModelCopyWith<$Res> {
  factory $LoginInformationModelCopyWith(LoginInformationModel value,
          $Res Function(LoginInformationModel) then) =
      _$LoginInformationModelCopyWithImpl<$Res>;
  $Res call({String idToken});
}

/// @nodoc
class _$LoginInformationModelCopyWithImpl<$Res>
    implements $LoginInformationModelCopyWith<$Res> {
  _$LoginInformationModelCopyWithImpl(this._value, this._then);

  final LoginInformationModel _value;
  // ignore: unused_field
  final $Res Function(LoginInformationModel) _then;

  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_value.copyWith(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LoginInformationModelCopyWith<$Res>
    implements $LoginInformationModelCopyWith<$Res> {
  factory _$LoginInformationModelCopyWith(_LoginInformationModel value,
          $Res Function(_LoginInformationModel) then) =
      __$LoginInformationModelCopyWithImpl<$Res>;
  @override
  $Res call({String idToken});
}

/// @nodoc
class __$LoginInformationModelCopyWithImpl<$Res>
    extends _$LoginInformationModelCopyWithImpl<$Res>
    implements _$LoginInformationModelCopyWith<$Res> {
  __$LoginInformationModelCopyWithImpl(_LoginInformationModel _value,
      $Res Function(_LoginInformationModel) _then)
      : super(_value, (v) => _then(v as _LoginInformationModel));

  @override
  _LoginInformationModel get _value => super._value as _LoginInformationModel;

  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_LoginInformationModel(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginInformationModel implements _LoginInformationModel {
  _$_LoginInformationModel({required this.idToken});

  @override
  final String idToken;

  @override
  String toString() {
    return 'LoginInformationModel(idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginInformationModel &&
            const DeepCollectionEquality().equals(other.idToken, idToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(idToken));

  @JsonKey(ignore: true)
  @override
  _$LoginInformationModelCopyWith<_LoginInformationModel> get copyWith =>
      __$LoginInformationModelCopyWithImpl<_LoginInformationModel>(
          this, _$identity);
}

abstract class _LoginInformationModel implements LoginInformationModel {
  factory _LoginInformationModel({required String idToken}) =
      _$_LoginInformationModel;

  @override
  String get idToken;
  @override
  @JsonKey(ignore: true)
  _$LoginInformationModelCopyWith<_LoginInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
