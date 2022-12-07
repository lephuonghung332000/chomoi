// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$DistrictModelCopyWithImpl<$Res, DistrictModel>;
  @useResult
  $Res call({String districtId, String districtName});
}

/// @nodoc
class _$DistrictModelCopyWithImpl<$Res, $Val extends DistrictModel>
    implements $DistrictModelCopyWith<$Res> {
  _$DistrictModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtId = null,
    Object? districtName = null,
  }) {
    return _then(_value.copyWith(
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DistrictModelCopyWith<$Res>
    implements $DistrictModelCopyWith<$Res> {
  factory _$$_DistrictModelCopyWith(
          _$_DistrictModel value, $Res Function(_$_DistrictModel) then) =
      __$$_DistrictModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String districtId, String districtName});
}

/// @nodoc
class __$$_DistrictModelCopyWithImpl<$Res>
    extends _$DistrictModelCopyWithImpl<$Res, _$_DistrictModel>
    implements _$$_DistrictModelCopyWith<$Res> {
  __$$_DistrictModelCopyWithImpl(
      _$_DistrictModel _value, $Res Function(_$_DistrictModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? districtId = null,
    Object? districtName = null,
  }) {
    return _then(_$_DistrictModel(
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as String,
      districtName: null == districtName
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
    return 'DistrictModel(districtId: $districtId, districtName: $districtName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DistrictModel &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, districtId, districtName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DistrictModelCopyWith<_$_DistrictModel> get copyWith =>
      __$$_DistrictModelCopyWithImpl<_$_DistrictModel>(this, _$identity);
}

abstract class _DistrictModel implements DistrictModel {
  factory _DistrictModel(
      {required final String districtId,
      required final String districtName}) = _$_DistrictModel;

  @override
  String get districtId;
  @override
  String get districtName;
  @override
  @JsonKey(ignore: true)
  _$$_DistrictModelCopyWith<_$_DistrictModel> get copyWith =>
      throw _privateConstructorUsedError;
}
