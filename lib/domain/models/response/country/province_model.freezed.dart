// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProvinceModel {
  String get provinceId => throw _privateConstructorUsedError;
  String get provinceName => throw _privateConstructorUsedError;
  String get provinceType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProvinceModelCopyWith<ProvinceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProvinceModelCopyWith<$Res> {
  factory $ProvinceModelCopyWith(
          ProvinceModel value, $Res Function(ProvinceModel) then) =
      _$ProvinceModelCopyWithImpl<$Res, ProvinceModel>;
  @useResult
  $Res call({String provinceId, String provinceName, String provinceType});
}

/// @nodoc
class _$ProvinceModelCopyWithImpl<$Res, $Val extends ProvinceModel>
    implements $ProvinceModelCopyWith<$Res> {
  _$ProvinceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceId = null,
    Object? provinceName = null,
    Object? provinceType = null,
  }) {
    return _then(_value.copyWith(
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String,
      provinceName: null == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
      provinceType: null == provinceType
          ? _value.provinceType
          : provinceType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProvinceModelCopyWith<$Res>
    implements $ProvinceModelCopyWith<$Res> {
  factory _$$_ProvinceModelCopyWith(
          _$_ProvinceModel value, $Res Function(_$_ProvinceModel) then) =
      __$$_ProvinceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String provinceId, String provinceName, String provinceType});
}

/// @nodoc
class __$$_ProvinceModelCopyWithImpl<$Res>
    extends _$ProvinceModelCopyWithImpl<$Res, _$_ProvinceModel>
    implements _$$_ProvinceModelCopyWith<$Res> {
  __$$_ProvinceModelCopyWithImpl(
      _$_ProvinceModel _value, $Res Function(_$_ProvinceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinceId = null,
    Object? provinceName = null,
    Object? provinceType = null,
  }) {
    return _then(_$_ProvinceModel(
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String,
      provinceName: null == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
      provinceType: null == provinceType
          ? _value.provinceType
          : provinceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProvinceModel implements _ProvinceModel {
  _$_ProvinceModel(
      {required this.provinceId,
      required this.provinceName,
      required this.provinceType});

  @override
  final String provinceId;
  @override
  final String provinceName;
  @override
  final String provinceType;

  @override
  String toString() {
    return 'ProvinceModel(provinceId: $provinceId, provinceName: $provinceName, provinceType: $provinceType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProvinceModel &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.provinceType, provinceType) ||
                other.provinceType == provinceType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, provinceId, provinceName, provinceType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProvinceModelCopyWith<_$_ProvinceModel> get copyWith =>
      __$$_ProvinceModelCopyWithImpl<_$_ProvinceModel>(this, _$identity);
}

abstract class _ProvinceModel implements ProvinceModel {
  factory _ProvinceModel(
      {required final String provinceId,
      required final String provinceName,
      required final String provinceType}) = _$_ProvinceModel;

  @override
  String get provinceId;
  @override
  String get provinceName;
  @override
  String get provinceType;
  @override
  @JsonKey(ignore: true)
  _$$_ProvinceModelCopyWith<_$_ProvinceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
