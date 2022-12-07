// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_new_token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$RefreshNewTokenModelCopyWithImpl<$Res, RefreshNewTokenModel>;
  @useResult
  $Res call({String idToken});
}

/// @nodoc
class _$RefreshNewTokenModelCopyWithImpl<$Res,
        $Val extends RefreshNewTokenModel>
    implements $RefreshNewTokenModelCopyWith<$Res> {
  _$RefreshNewTokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
  }) {
    return _then(_value.copyWith(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefreshNewTokenModelCopyWith<$Res>
    implements $RefreshNewTokenModelCopyWith<$Res> {
  factory _$$_RefreshNewTokenModelCopyWith(_$_RefreshNewTokenModel value,
          $Res Function(_$_RefreshNewTokenModel) then) =
      __$$_RefreshNewTokenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idToken});
}

/// @nodoc
class __$$_RefreshNewTokenModelCopyWithImpl<$Res>
    extends _$RefreshNewTokenModelCopyWithImpl<$Res, _$_RefreshNewTokenModel>
    implements _$$_RefreshNewTokenModelCopyWith<$Res> {
  __$$_RefreshNewTokenModelCopyWithImpl(_$_RefreshNewTokenModel _value,
      $Res Function(_$_RefreshNewTokenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
  }) {
    return _then(_$_RefreshNewTokenModel(
      idToken: null == idToken
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
            other is _$_RefreshNewTokenModel &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshNewTokenModelCopyWith<_$_RefreshNewTokenModel> get copyWith =>
      __$$_RefreshNewTokenModelCopyWithImpl<_$_RefreshNewTokenModel>(
          this, _$identity);
}

abstract class _RefreshNewTokenModel implements RefreshNewTokenModel {
  factory _RefreshNewTokenModel({required final String idToken}) =
      _$_RefreshNewTokenModel;

  @override
  String get idToken;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshNewTokenModelCopyWith<_$_RefreshNewTokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
