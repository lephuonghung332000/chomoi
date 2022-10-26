// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'refresh_new_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RefreshNewTokenModelTearOff {
  const _$RefreshNewTokenModelTearOff();

  _RefreshNewTokenModel call({required String idToken}) {
    return _RefreshNewTokenModel(
      idToken: idToken,
    );
  }
}

/// @nodoc
const $RefreshNewTokenModel = _$RefreshNewTokenModelTearOff();

/// @nodoc
mixin _$RefreshNewTokenModel {
  String get idToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RefreshNewTokenModelCopyWith<RefreshNewTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshNewTokenModelCopyWith<$Res> {
  factory $RefreshNewTokenModelCopyWith(RefreshNewTokenModel value,
          $Res Function(RefreshNewTokenModel) then) =
      _$RefreshNewTokenModelCopyWithImpl<$Res>;
  $Res call({String idToken});
}

/// @nodoc
class _$RefreshNewTokenModelCopyWithImpl<$Res>
    implements $RefreshNewTokenModelCopyWith<$Res> {
  _$RefreshNewTokenModelCopyWithImpl(this._value, this._then);

  final RefreshNewTokenModel _value;
  // ignore: unused_field
  final $Res Function(RefreshNewTokenModel) _then;

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
abstract class _$RefreshNewTokenModelCopyWith<$Res>
    implements $RefreshNewTokenModelCopyWith<$Res> {
  factory _$RefreshNewTokenModelCopyWith(_RefreshNewTokenModel value,
          $Res Function(_RefreshNewTokenModel) then) =
      __$RefreshNewTokenModelCopyWithImpl<$Res>;
  @override
  $Res call({String idToken});
}

/// @nodoc
class __$RefreshNewTokenModelCopyWithImpl<$Res>
    extends _$RefreshNewTokenModelCopyWithImpl<$Res>
    implements _$RefreshNewTokenModelCopyWith<$Res> {
  __$RefreshNewTokenModelCopyWithImpl(
      _RefreshNewTokenModel _value, $Res Function(_RefreshNewTokenModel) _then)
      : super(_value, (v) => _then(v as _RefreshNewTokenModel));

  @override
  _RefreshNewTokenModel get _value => super._value as _RefreshNewTokenModel;

  @override
  $Res call({
    Object? idToken = freezed,
  }) {
    return _then(_RefreshNewTokenModel(
      idToken: idToken == freezed
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RefreshNewTokenModel implements _RefreshNewTokenModel {
  _$_RefreshNewTokenModel({required this.idToken});

  @override
  final String idToken;

  @override
  String toString() {
    return 'RefreshNewTokenModel(idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshNewTokenModel &&
            const DeepCollectionEquality().equals(other.idToken, idToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(idToken));

  @JsonKey(ignore: true)
  @override
  _$RefreshNewTokenModelCopyWith<_RefreshNewTokenModel> get copyWith =>
      __$RefreshNewTokenModelCopyWithImpl<_RefreshNewTokenModel>(
          this, _$identity);
}

abstract class _RefreshNewTokenModel implements RefreshNewTokenModel {
  factory _RefreshNewTokenModel({required String idToken}) =
      _$_RefreshNewTokenModel;

  @override
  String get idToken;
  @override
  @JsonKey(ignore: true)
  _$RefreshNewTokenModelCopyWith<_RefreshNewTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
