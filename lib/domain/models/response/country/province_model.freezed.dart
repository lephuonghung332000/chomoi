// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'province_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProvinceModelTearOff {
  const _$ProvinceModelTearOff();

  _ProvinceModel call(
      {required String provinceId,
      required String provinceName,
      required String provinceType}) {
    return _ProvinceModel(
      provinceId: provinceId,
      provinceName: provinceName,
      provinceType: provinceType,
    );
  }
}

/// @nodoc
const $ProvinceModel = _$ProvinceModelTearOff();

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
      _$ProvinceModelCopyWithImpl<$Res>;
  $Res call({String provinceId, String provinceName, String provinceType});
}

/// @nodoc
class _$ProvinceModelCopyWithImpl<$Res>
    implements $ProvinceModelCopyWith<$Res> {
  _$ProvinceModelCopyWithImpl(this._value, this._then);

  final ProvinceModel _value;
  // ignore: unused_field
  final $Res Function(ProvinceModel) _then;

  @override
  $Res call({
    Object? provinceId = freezed,
    Object? provinceName = freezed,
    Object? provinceType = freezed,
  }) {
    return _then(_value.copyWith(
      provinceId: provinceId == freezed
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String,
      provinceName: provinceName == freezed
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
      provinceType: provinceType == freezed
          ? _value.provinceType
          : provinceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ProvinceModelCopyWith<$Res>
    implements $ProvinceModelCopyWith<$Res> {
  factory _$ProvinceModelCopyWith(
          _ProvinceModel value, $Res Function(_ProvinceModel) then) =
      __$ProvinceModelCopyWithImpl<$Res>;
  @override
  $Res call({String provinceId, String provinceName, String provinceType});
}

/// @nodoc
class __$ProvinceModelCopyWithImpl<$Res>
    extends _$ProvinceModelCopyWithImpl<$Res>
    implements _$ProvinceModelCopyWith<$Res> {
  __$ProvinceModelCopyWithImpl(
      _ProvinceModel _value, $Res Function(_ProvinceModel) _then)
      : super(_value, (v) => _then(v as _ProvinceModel));

  @override
  _ProvinceModel get _value => super._value as _ProvinceModel;

  @override
  $Res call({
    Object? provinceId = freezed,
    Object? provinceName = freezed,
    Object? provinceType = freezed,
  }) {
    return _then(_ProvinceModel(
      provinceId: provinceId == freezed
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as String,
      provinceName: provinceName == freezed
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
      provinceType: provinceType == freezed
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
            other is _ProvinceModel &&
            const DeepCollectionEquality()
                .equals(other.provinceId, provinceId) &&
            const DeepCollectionEquality()
                .equals(other.provinceName, provinceName) &&
            const DeepCollectionEquality()
                .equals(other.provinceType, provinceType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(provinceId),
      const DeepCollectionEquality().hash(provinceName),
      const DeepCollectionEquality().hash(provinceType));

  @JsonKey(ignore: true)
  @override
  _$ProvinceModelCopyWith<_ProvinceModel> get copyWith =>
      __$ProvinceModelCopyWithImpl<_ProvinceModel>(this, _$identity);
}

abstract class _ProvinceModel implements ProvinceModel {
  factory _ProvinceModel(
      {required String provinceId,
      required String provinceName,
      required String provinceType}) = _$_ProvinceModel;

  @override
  String get provinceId;
  @override
  String get provinceName;
  @override
  String get provinceType;
  @override
  @JsonKey(ignore: true)
  _$ProvinceModelCopyWith<_ProvinceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
