// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$SearchHistoryModelCopyWithImpl<$Res, SearchHistoryModel>;
  @useResult
  $Res call({String id, String userId, double createAt, String key});
}

/// @nodoc
class _$SearchHistoryModelCopyWithImpl<$Res, $Val extends SearchHistoryModel>
    implements $SearchHistoryModelCopyWith<$Res> {
  _$SearchHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createAt = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchHistoryModelCopyWith<$Res>
    implements $SearchHistoryModelCopyWith<$Res> {
  factory _$$_SearchHistoryModelCopyWith(_$_SearchHistoryModel value,
          $Res Function(_$_SearchHistoryModel) then) =
      __$$_SearchHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String userId, double createAt, String key});
}

/// @nodoc
class __$$_SearchHistoryModelCopyWithImpl<$Res>
    extends _$SearchHistoryModelCopyWithImpl<$Res, _$_SearchHistoryModel>
    implements _$$_SearchHistoryModelCopyWith<$Res> {
  __$$_SearchHistoryModelCopyWithImpl(
      _$_SearchHistoryModel _value, $Res Function(_$_SearchHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? createAt = null,
    Object? key = null,
  }) {
    return _then(_$_SearchHistoryModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as double,
      key: null == key
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
            other is _$_SearchHistoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, userId, createAt, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchHistoryModelCopyWith<_$_SearchHistoryModel> get copyWith =>
      __$$_SearchHistoryModelCopyWithImpl<_$_SearchHistoryModel>(
          this, _$identity);
}

abstract class _SearchHistoryModel implements SearchHistoryModel {
  factory _SearchHistoryModel(
      {required final String id,
      required final String userId,
      required final double createAt,
      required final String key}) = _$_SearchHistoryModel;

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
  _$$_SearchHistoryModelCopyWith<_$_SearchHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
