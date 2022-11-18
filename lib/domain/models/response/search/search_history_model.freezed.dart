// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchHistoryModelTearOff {
  const _$SearchHistoryModelTearOff();

  _SearchHistoryModel call(
      {required String id,
      required String userId,
      required double createAt,
      required String key}) {
    return _SearchHistoryModel(
      id: id,
      userId: userId,
      createAt: createAt,
      key: key,
    );
  }
}

/// @nodoc
const $SearchHistoryModel = _$SearchHistoryModelTearOff();

/// @nodoc
mixin _$SearchHistoryModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get createAt => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchHistoryModelCopyWith<SearchHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryModelCopyWith<$Res> {
  factory $SearchHistoryModelCopyWith(
          SearchHistoryModel value, $Res Function(SearchHistoryModel) then) =
      _$SearchHistoryModelCopyWithImpl<$Res>;
  $Res call({String id, String userId, double createAt, String key});
}

/// @nodoc
class _$SearchHistoryModelCopyWithImpl<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  _$SearchHistoryModelCopyWithImpl(this._value, this._then);

  final SearchHistoryModel _value;
  // ignore: unused_field
  final $Res Function(SearchHistoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? createAt = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SearchHistoryModelCopyWith<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  factory _$SearchHistoryModelCopyWith(
          _SearchHistoryModel value, $Res Function(_SearchHistoryModel) then) =
      __$SearchHistoryModelCopyWithImpl<$Res>;
  @override
  $Res call({String id, String userId, double createAt, String key});
}

/// @nodoc
class __$SearchHistoryModelCopyWithImpl<$Res>
    extends _$SearchHistoryModelCopyWithImpl<$Res>
    implements _$SearchHistoryModelCopyWith<$Res> {
  __$SearchHistoryModelCopyWithImpl(
      _SearchHistoryModel _value, $Res Function(_SearchHistoryModel) _then)
      : super(_value, (v) => _then(v as _SearchHistoryModel));

  @override
  _SearchHistoryModel get _value => super._value as _SearchHistoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? createAt = freezed,
    Object? key = freezed,
  }) {
    return _then(_SearchHistoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: createAt == freezed
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchHistoryModel implements _SearchHistoryModel {
  _$_SearchHistoryModel(
      {required this.id,
      required this.userId,
      required this.createAt,
      required this.key});

  @override
  final String id;
  @override
  final String userId;
  @override
  final double createAt;
  @override
  final String key;

  @override
  String toString() {
    return 'SearchHistoryModel(id: $id, userId: $userId, createAt: $createAt, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchHistoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.createAt, createAt) &&
            const DeepCollectionEquality().equals(other.key, key));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(createAt),
      const DeepCollectionEquality().hash(key));

  @JsonKey(ignore: true)
  @override
  _$SearchHistoryModelCopyWith<_SearchHistoryModel> get copyWith =>
      __$SearchHistoryModelCopyWithImpl<_SearchHistoryModel>(this, _$identity);
}

abstract class _SearchHistoryModel implements SearchHistoryModel {
  factory _SearchHistoryModel(
      {required String id,
      required String userId,
      required double createAt,
      required String key}) = _$_SearchHistoryModel;

  @override
  String get id;
  @override
  String get userId;
  @override
  double get createAt;
  @override
  String get key;
  @override
  @JsonKey(ignore: true)
  _$SearchHistoryModelCopyWith<_SearchHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
