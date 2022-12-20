// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpInformationModel {
  String get idToken => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpInformationModelCopyWith<SignUpInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpInformationModelCopyWith<$Res> {
  factory $SignUpInformationModelCopyWith(SignUpInformationModel value,
          $Res Function(SignUpInformationModel) then) =
      _$SignUpInformationModelCopyWithImpl<$Res, SignUpInformationModel>;
  @useResult
  $Res call({String idToken, String userId});
}

/// @nodoc
class _$SignUpInformationModelCopyWithImpl<$Res,
        $Val extends SignUpInformationModel>
    implements $SignUpInformationModelCopyWith<$Res> {
  _$SignUpInformationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpInformationModelCopyWith<$Res>
    implements $SignUpInformationModelCopyWith<$Res> {
  factory _$$_SignUpInformationModelCopyWith(_$_SignUpInformationModel value,
          $Res Function(_$_SignUpInformationModel) then) =
      __$$_SignUpInformationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idToken, String userId});
}

/// @nodoc
class __$$_SignUpInformationModelCopyWithImpl<$Res>
    extends _$SignUpInformationModelCopyWithImpl<$Res,
        _$_SignUpInformationModel>
    implements _$$_SignUpInformationModelCopyWith<$Res> {
  __$$_SignUpInformationModelCopyWithImpl(_$_SignUpInformationModel _value,
      $Res Function(_$_SignUpInformationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? userId = null,
  }) {
    return _then(_$_SignUpInformationModel(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpInformationModel implements _SignUpInformationModel {
  _$_SignUpInformationModel({required this.idToken, required this.userId});

  @override
  final String idToken;
  @override
  final String userId;

  @override
  String toString() {
    return 'SignUpInformationModel(idToken: $idToken, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpInformationModel &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpInformationModelCopyWith<_$_SignUpInformationModel> get copyWith =>
      __$$_SignUpInformationModelCopyWithImpl<_$_SignUpInformationModel>(
          this, _$identity);
}

abstract class _SignUpInformationModel implements SignUpInformationModel {
  factory _SignUpInformationModel(
      {required final String idToken,
      required final String userId}) = _$_SignUpInformationModel;

  @override
  String get idToken;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpInformationModelCopyWith<_$_SignUpInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
