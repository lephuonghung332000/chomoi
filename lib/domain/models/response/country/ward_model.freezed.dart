// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ward_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WardModelTearOff {
  const _$WardModelTearOff();

  _WardModel call({required String wardId, required String wardName}) {
    return _WardModel(
      wardId: wardId,
      wardName: wardName,
    );
  }
}

/// @nodoc
const $WardModel = _$WardModelTearOff();

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
      _$WardModelCopyWithImpl<$Res>;
  $Res call({String wardId, String wardName});
}

/// @nodoc
class _$WardModelCopyWithImpl<$Res> implements $WardModelCopyWith<$Res> {
  _$WardModelCopyWithImpl(this._value, this._then);

  final WardModel _value;
  // ignore: unused_field
  final $Res Function(WardModel) _then;

  @override
  $Res call({
    Object? wardId = freezed,
    Object? wardName = freezed,
  }) {
    return _then(_value.copyWith(
      wardId: wardId == freezed
          ? _value.wardId
          : wardId // ignore: cast_nullable_to_non_nullable
              as String,
      wardName: wardName == freezed
          ? _value.wardName
          : wardName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WardModelCopyWith<$Res> implements $WardModelCopyWith<$Res> {
  factory _$WardModelCopyWith(
          _WardModel value, $Res Function(_WardModel) then) =
      __$WardModelCopyWithImpl<$Res>;
  @override
  $Res call({String wardId, String wardName});
}

/// @nodoc
class __$WardModelCopyWithImpl<$Res> extends _$WardModelCopyWithImpl<$Res>
    implements _$WardModelCopyWith<$Res> {
  __$WardModelCopyWithImpl(_WardModel _value, $Res Function(_WardModel) _then)
      : super(_value, (v) => _then(v as _WardModel));

  @override
  _WardModel get _value => super._value as _WardModel;

  @override
  $Res call({
    Object? wardId = freezed,
    Object? wardName = freezed,
  }) {
    return _then(_WardModel(
      wardId: wardId == freezed
          ? _value.wardId
          : wardId // ignore: cast_nullable_to_non_nullable
              as String,
      wardName: wardName == freezed
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
            other is _WardModel &&
            const DeepCollectionEquality().equals(other.wardId, wardId) &&
            const DeepCollectionEquality().equals(other.wardName, wardName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(wardId),
      const DeepCollectionEquality().hash(wardName));

  @JsonKey(ignore: true)
  @override
  _$WardModelCopyWith<_WardModel> get copyWith =>
      __$WardModelCopyWithImpl<_WardModel>(this, _$identity);
}

abstract class _WardModel implements WardModel {
  factory _WardModel({required String wardId, required String wardName}) =
      _$_WardModel;

  @override
  String get wardId;
  @override
  String get wardName;
  @override
  @JsonKey(ignore: true)
  _$WardModelCopyWith<_WardModel> get copyWith =>
      throw _privateConstructorUsedError;
}
