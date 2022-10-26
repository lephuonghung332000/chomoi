// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sign_up_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpInformationModelTearOff {
  const _$SignUpInformationModelTearOff();

  _SignUpInformationModel call({required String idToken}) {
    return _SignUpInformationModel(
      idToken: idToken,
    );
  }
}

/// @nodoc
const $SignUpInformationModel = _$SignUpInformationModelTearOff();

/// @nodoc
mixin _$SignUpInformationModel {
  String get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpInformationModelCopyWith<SignUpInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpInformationModelCopyWith<$Res> {
  factory $SignUpInformationModelCopyWith(SignUpInformationModel value,
          $Res Function(SignUpInformationModel) then) =
      _$SignUpInformationModelCopyWithImpl<$Res>;
  $Res call({String idToken});
}

/// @nodoc
class _$SignUpInformationModelCopyWithImpl<$Res>
    implements $SignUpInformationModelCopyWith<$Res> {
  _$SignUpInformationModelCopyWithImpl(this._value, this._then);

  final SignUpInformationModel _value;
  // ignore: unused_field
  final $Res Function(SignUpInformationModel) _then;

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
abstract class _$SignUpInformationModelCopyWith<$Res>
    implements $SignUpInformationModelCopyWith<$Res> {
  factory _$SignUpInformationModelCopyWith(_SignUpInformationModel value,
          $Res Function(_SignUpInformationModel) then) =
      __$SignUpInformationModelCopyWithImpl<$Res>;
  @override
  $Res call({String idToken});
}

/// @nodoc
class __$SignUpInformationModelCopyWithImpl<$Res>
    extends _$SignUpInformationModelCopyWithImpl<$Res>
    implements _$SignUpInformationModelCopyWith<$Res> {
  __$SignUpInformationModelCopyWithImpl(_SignUpInformationModel _value,
      $Res Function(_SignUpInformationModel) _then)
      : super(_value, (v) => _then(v as _SignUpInformationModel));

  @override
  _SignUpInformationModel get _value => super._value as _SignUpInformationModel;

  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_SignUpInformationModel(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpInformationModel implements _SignUpInformationModel {
  _$_SignUpInformationModel({required this.idToken});

  @override
  final String idToken;

  @override
  String toString() {
    return 'SignUpInformationModel(idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpInformationModel &&
            const DeepCollectionEquality().equals(other.idToken, idToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(idToken));

  @JsonKey(ignore: true)
  @override
  _$SignUpInformationModelCopyWith<_SignUpInformationModel> get copyWith =>
      __$SignUpInformationModelCopyWithImpl<_SignUpInformationModel>(
          this, _$identity);
}

abstract class _SignUpInformationModel implements SignUpInformationModel {
  factory _SignUpInformationModel({required String idToken}) =
      _$_SignUpInformationModel;

  @override
  String get idToken;
  @override
  @JsonKey(ignore: true)
  _$SignUpInformationModelCopyWith<_SignUpInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
