// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DistrictModelTearOff {
  const _$DistrictModelTearOff();

  _DistrictModel call(
      {required String districtId, required String districtName}) {
    return _DistrictModel(
      districtId: districtId,
      districtName: districtName,
    );
  }
}

/// @nodoc
const $DistrictModel = _$DistrictModelTearOff();

/// @nodoc
mixin _$DistrictModel {
  String get districtId => throw _privateConstructorUsedError;
  String get districtName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DistrictModelCopyWith<DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DistrictModelCopyWith<$Res> {
  factory $DistrictModelCopyWith(
          DistrictModel value, $Res Function(DistrictModel) then) =
      _$DistrictModelCopyWithImpl<$Res>;
  $Res call({String districtId, String districtName});
}

/// @nodoc
class _$DistrictModelCopyWithImpl<$Res>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._value, this._then);

  final DistrictModel _value;
  // ignore: unused_field
  final $Res Function(DistrictModel) _then;

  @override
  $Res call({
    Object? districtId = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_value.copyWith(
      districtId: districtId == freezed
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: districtName == freezed
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DistrictModelCopyWith<$Res>
    implements $DistrictModelCopyWith<$Res> {
  factory _$DistrictModelCopyWith(
          _DistrictModel value, $Res Function(_DistrictModel) then) =
      __$DistrictModelCopyWithImpl<$Res>;
  @override
  $Res call({String districtId, String districtName});
}

/// @nodoc
class __$DistrictModelCopyWithImpl<$Res>
    extends _$DistrictModelCopyWithImpl<$Res>
    implements _$DistrictModelCopyWith<$Res> {
  __$DistrictModelCopyWithImpl(
      _DistrictModel _value, $Res Function(_DistrictModel) _then)
      : super(_value, (v) => _then(v as _DistrictModel));

  @override
  _DistrictModel get _value => super._value as _DistrictModel;

  @override
  $Res call({
    Object? districtId = freezed,
    Object? districtName = freezed,
  }) {
    return _then(_DistrictModel(
      districtId: districtId == freezed
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: districtName == freezed
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DistrictModel implements _DistrictModel {
  _$_DistrictModel({required this.districtId, required this.districtName});

  @override
  final String districtId;
  @override
  final String districtName;

  @override
  String toString() {
    return districtName;
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DistrictModel &&
            const DeepCollectionEquality()
                .equals(other.districtId, districtId) &&
            const DeepCollectionEquality()
                .equals(other.districtName, districtName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(districtId),
      const DeepCollectionEquality().hash(districtName));

  @JsonKey(ignore: true)
  @override
  _$DistrictModelCopyWith<_DistrictModel> get copyWith =>
      __$DistrictModelCopyWithImpl<_DistrictModel>(this, _$identity);
}

abstract class _DistrictModel implements DistrictModel {
  factory _DistrictModel(
      {required String districtId,
      required String districtName}) = _$_DistrictModel;

  @override
  String get districtId;
  @override
  String get districtName;
  @override
  @JsonKey(ignore: true)
  _$DistrictModelCopyWith<_DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}
