// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationPagingModelTearOff {
  const _$NotificationPagingModelTearOff();

  _NotificationPagingModel call(
      {required int total, required List<NotificationModel> posts}) {
    return _NotificationPagingModel(
      total: total,
      posts: posts,
    );
  }
}

/// @nodoc
const $NotificationPagingModel = _$NotificationPagingModelTearOff();

/// @nodoc
mixin _$NotificationPagingModel {
  int get total => throw _privateConstructorUsedError;
  List<NotificationModel> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationPagingModelCopyWith<NotificationPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPagingModelCopyWith<$Res> {
  factory $NotificationPagingModelCopyWith(NotificationPagingModel value,
          $Res Function(NotificationPagingModel) then) =
      _$NotificationPagingModelCopyWithImpl<$Res>;
  $Res call({int total, List<NotificationModel> posts});
}

/// @nodoc
class _$NotificationPagingModelCopyWithImpl<$Res>
    implements $NotificationPagingModelCopyWith<$Res> {
  _$NotificationPagingModelCopyWithImpl(this._value, this._then);

  final NotificationPagingModel _value;
  // ignore: unused_field
  final $Res Function(NotificationPagingModel) _then;

  @override
  $Res call({
    Object? total = freezed,
    Object? posts = freezed,
  }) {
    return _then(_value.copyWith(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc
abstract class _$NotificationPagingModelCopyWith<$Res>
    implements $NotificationPagingModelCopyWith<$Res> {
  factory _$NotificationPagingModelCopyWith(_NotificationPagingModel value,
          $Res Function(_NotificationPagingModel) then) =
      __$NotificationPagingModelCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<NotificationModel> posts});
}

/// @nodoc
class __$NotificationPagingModelCopyWithImpl<$Res>
    extends _$NotificationPagingModelCopyWithImpl<$Res>
    implements _$NotificationPagingModelCopyWith<$Res> {
  __$NotificationPagingModelCopyWithImpl(_NotificationPagingModel _value,
      $Res Function(_NotificationPagingModel) _then)
      : super(_value, (v) => _then(v as _NotificationPagingModel));

  @override
  _NotificationPagingModel get _value =>
      super._value as _NotificationPagingModel;

  @override
  $Res call({
    Object? total = freezed,
    Object? posts = freezed,
  }) {
    return _then(_NotificationPagingModel(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
    ));
  }
}

/// @nodoc

class _$_NotificationPagingModel implements _NotificationPagingModel {
  _$_NotificationPagingModel({required this.total, required this.posts});

  @override
  final int total;
  @override
  final List<NotificationModel> posts;

  @override
  String toString() {
    return 'NotificationPagingModel(total: $total, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationPagingModel &&
            const DeepCollectionEquality().equals(other.total, total) &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(total),
      const DeepCollectionEquality().hash(posts));

  @JsonKey(ignore: true)
  @override
  _$NotificationPagingModelCopyWith<_NotificationPagingModel> get copyWith =>
      __$NotificationPagingModelCopyWithImpl<_NotificationPagingModel>(
          this, _$identity);
}

abstract class _NotificationPagingModel implements NotificationPagingModel {
  factory _NotificationPagingModel(
      {required int total,
      required List<NotificationModel> posts}) = _$_NotificationPagingModel;

  @override
  int get total;
  @override
  List<NotificationModel> get posts;
  @override
  @JsonKey(ignore: true)
  _$NotificationPagingModelCopyWith<_NotificationPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
