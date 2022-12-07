// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$SearchRequestModelCopyWithImpl<$Res, SearchRequestModel>;
  @useResult
  $Res call({String key, String userId});
}

/// @nodoc
class _$SearchRequestModelCopyWithImpl<$Res, $Val extends SearchRequestModel>
    implements $SearchRequestModelCopyWith<$Res> {
  _$SearchRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchRequestModelCopyWith<$Res>
    implements $SearchRequestModelCopyWith<$Res> {
  factory _$$_SearchRequestModelCopyWith(_$_SearchRequestModel value,
          $Res Function(_$_SearchRequestModel) then) =
      __$$_SearchRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String userId});
}

/// @nodoc
class __$$_SearchRequestModelCopyWithImpl<$Res>
    extends _$SearchRequestModelCopyWithImpl<$Res, _$_SearchRequestModel>
    implements _$$_SearchRequestModelCopyWith<$Res> {
  __$$_SearchRequestModelCopyWithImpl(
      _$_SearchRequestModel _value, $Res Function(_$_SearchRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? userId = null,
  }) {
    return _then(_$_SearchRequestModel(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
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
            other is _$_SearchRequestModel &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchRequestModelCopyWith<_$_SearchRequestModel> get copyWith =>
      __$$_SearchRequestModelCopyWithImpl<_$_SearchRequestModel>(
          this, _$identity);
}

abstract class _SearchRequestModel implements SearchRequestModel {
  factory _SearchRequestModel(
      {required final String key,
      required final String userId}) = _$_SearchRequestModel;

  @override
  String get key;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$_SearchRequestModelCopyWith<_$_SearchRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
