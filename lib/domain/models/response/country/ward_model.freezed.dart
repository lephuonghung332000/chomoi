// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WardModel {
  String get wardId => throw _privateConstructorUsedError;
  String get wardName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WardModelCopyWith<WardModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WardModelCopyWith<$Res> {
  factory $WardModelCopyWith(WardModel value, $Res Function(WardModel) then) =
      _$WardModelCopyWithImpl<$Res, WardModel>;
  @useResult
  $Res call({String wardId, String wardName});
}

/// @nodoc
class _$WardModelCopyWithImpl<$Res, $Val extends WardModel>
    implements $WardModelCopyWith<$Res> {
  _$WardModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wardId = null,
    Object? wardName = null,
  }) {
    return _then(_value.copyWith(
      wardId: null == wardId
          ? _value.wardId
          : wardId // ignore: cast_nullable_to_non_nullable
              as String,
      wardName: null == wardName
          ? _value.wardName
          : wardName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WardModelCopyWith<$Res> implements $WardModelCopyWith<$Res> {
  factory _$$_WardModelCopyWith(
          _$_WardModel value, $Res Function(_$_WardModel) then) =
      __$$_WardModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String wardId, String wardName});
}

/// @nodoc
class __$$_WardModelCopyWithImpl<$Res>
    extends _$WardModelCopyWithImpl<$Res, _$_WardModel>
    implements _$$_WardModelCopyWith<$Res> {
  __$$_WardModelCopyWithImpl(
      _$_WardModel _value, $Res Function(_$_WardModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wardId = null,
    Object? wardName = null,
  }) {
    return _then(_$_WardModel(
      wardId: null == wardId
          ? _value.wardId
          : wardId // ignore: cast_nullable_to_non_nullable
              as String,
      wardName: null == wardName
          ? _value.wardName
          : wardName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WardModel implements _WardModel {
  _$_WardModel({required this.wardId, required this.wardName});

  @override
  final String wardId;
  @override
  final String wardName;

  @override
  String toString() {
    return 'WardModel(wardId: $wardId, wardName: $wardName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WardModel &&
            (identical(other.wardId, wardId) || other.wardId == wardId) &&
            (identical(other.wardName, wardName) ||
                other.wardName == wardName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wardId, wardName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WardModelCopyWith<_$_WardModel> get copyWith =>
      __$$_WardModelCopyWithImpl<_$_WardModel>(this, _$identity);
}

abstract class _WardModel implements WardModel {
  factory _WardModel(
      {required final String wardId,
      required final String wardName}) = _$_WardModel;

  @override
  String get wardId;
  @override
  String get wardName;
  @override
  @JsonKey(ignore: true)
  _$$_WardModelCopyWith<_$_WardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
