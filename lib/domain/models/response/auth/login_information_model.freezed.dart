// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$LoginInformationModelCopyWithImpl<$Res, LoginInformationModel>;
  @useResult
  $Res call({String idToken});
}

/// @nodoc
class _$LoginInformationModelCopyWithImpl<$Res,
        $Val extends LoginInformationModel>
    implements $LoginInformationModelCopyWith<$Res> {
  _$LoginInformationModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_LoginInformationModelCopyWith<$Res>
    implements $LoginInformationModelCopyWith<$Res> {
  factory _$$_LoginInformationModelCopyWith(_$_LoginInformationModel value,
          $Res Function(_$_LoginInformationModel) then) =
      __$$_LoginInformationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idToken});
}

/// @nodoc
class __$$_LoginInformationModelCopyWithImpl<$Res>
    extends _$LoginInformationModelCopyWithImpl<$Res, _$_LoginInformationModel>
    implements _$$_LoginInformationModelCopyWith<$Res> {
  __$$_LoginInformationModelCopyWithImpl(_$_LoginInformationModel _value,
      $Res Function(_$_LoginInformationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
  }) {
    return _then(_$_LoginInformationModel(
      idToken: null == idToken
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
            other is _$_LoginInformationModel &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginInformationModelCopyWith<_$_LoginInformationModel> get copyWith =>
      __$$_LoginInformationModelCopyWithImpl<_$_LoginInformationModel>(
          this, _$identity);
}

abstract class _LoginInformationModel implements LoginInformationModel {
  factory _LoginInformationModel({required final String idToken}) =
      _$_LoginInformationModel;

  @override
  String get idToken;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInformationModelCopyWith<_$_LoginInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
