// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchRequestModelTearOff {
  const _$SearchRequestModelTearOff();

  _SearchRequestModel call({required String key, required String userId}) {
    return _SearchRequestModel(
      key: key,
      userId: userId,
    );
  }
}

/// @nodoc
const $SearchRequestModel = _$SearchRequestModelTearOff();

/// @nodoc
mixin _$SearchRequestModel {
  String get key => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchRequestModelCopyWith<SearchRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchRequestModelCopyWith<$Res> {
  factory $SearchRequestModelCopyWith(
          SearchRequestModel value, $Res Function(SearchRequestModel) then) =
      _$SearchRequestModelCopyWithImpl<$Res>;
  $Res call({String key, String userId});
}

/// @nodoc
class _$SearchRequestModelCopyWithImpl<$Res>
    implements $SearchRequestModelCopyWith<$Res> {
  _$SearchRequestModelCopyWithImpl(this._value, this._then);

  final SearchRequestModel _value;
  // ignore: unused_field
  final $Res Function(SearchRequestModel) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchRequestModelCopyWith<$Res>
    implements $SearchRequestModelCopyWith<$Res> {
  factory _$SearchRequestModelCopyWith(
          _SearchRequestModel value, $Res Function(_SearchRequestModel) then) =
      __$SearchRequestModelCopyWithImpl<$Res>;
  @override
  $Res call({String key, String userId});
}

/// @nodoc
class __$SearchRequestModelCopyWithImpl<$Res>
    extends _$SearchRequestModelCopyWithImpl<$Res>
    implements _$SearchRequestModelCopyWith<$Res> {
  __$SearchRequestModelCopyWithImpl(
      _SearchRequestModel _value, $Res Function(_SearchRequestModel) _then)
      : super(_value, (v) => _then(v as _SearchRequestModel));

  @override
  _SearchRequestModel get _value => super._value as _SearchRequestModel;

  @override
  $Res call({
    Object? key = freezed,
    Object? userId = freezed,
  }) {
    return _then(_SearchRequestModel(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchRequestModel implements _SearchRequestModel {
  _$_SearchRequestModel({required this.key, required this.userId});

  @override
  final String key;
  @override
  final String userId;

  @override
  String toString() {
    return 'SearchRequestModel(key: $key, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchRequestModel &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$SearchRequestModelCopyWith<_SearchRequestModel> get copyWith =>
      __$SearchRequestModelCopyWithImpl<_SearchRequestModel>(this, _$identity);
}

abstract class _SearchRequestModel implements SearchRequestModel {
  factory _SearchRequestModel({required String key, required String userId}) =
      _$_SearchRequestModel;

  @override
  String get key;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$SearchRequestModelCopyWith<_SearchRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
