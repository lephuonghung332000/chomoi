// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostPagingModelTearOff {
  const _$PostPagingModelTearOff();

  _PostPagingModel call({required int total, required List<PostModel> posts}) {
    return _PostPagingModel(
      total: total,
      posts: posts,
    );
  }
}

/// @nodoc
const $PostPagingModel = _$PostPagingModelTearOff();

/// @nodoc
mixin _$PostPagingModel {
  int get total => throw _privateConstructorUsedError;
  List<PostModel> get posts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostPagingModelCopyWith<PostPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostPagingModelCopyWith<$Res> {
  factory $PostPagingModelCopyWith(
          PostPagingModel value, $Res Function(PostPagingModel) then) =
      _$PostPagingModelCopyWithImpl<$Res>;
  $Res call({int total, List<PostModel> posts});
}

/// @nodoc
class _$PostPagingModelCopyWithImpl<$Res>
    implements $PostPagingModelCopyWith<$Res> {
  _$PostPagingModelCopyWithImpl(this._value, this._then);

  final PostPagingModel _value;
  // ignore: unused_field
  final $Res Function(PostPagingModel) _then;

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
              as List<PostModel>,
    ));
  }
}

/// @nodoc
abstract class _$PostPagingModelCopyWith<$Res>
    implements $PostPagingModelCopyWith<$Res> {
  factory _$PostPagingModelCopyWith(
          _PostPagingModel value, $Res Function(_PostPagingModel) then) =
      __$PostPagingModelCopyWithImpl<$Res>;
  @override
  $Res call({int total, List<PostModel> posts});
}

/// @nodoc
class __$PostPagingModelCopyWithImpl<$Res>
    extends _$PostPagingModelCopyWithImpl<$Res>
    implements _$PostPagingModelCopyWith<$Res> {
  __$PostPagingModelCopyWithImpl(
      _PostPagingModel _value, $Res Function(_PostPagingModel) _then)
      : super(_value, (v) => _then(v as _PostPagingModel));

  @override
  _PostPagingModel get _value => super._value as _PostPagingModel;

  @override
  $Res call({
    Object? total = freezed,
    Object? posts = freezed,
  }) {
    return _then(_PostPagingModel(
      total: total == freezed
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ));
  }
}

/// @nodoc

class _$_PostPagingModel implements _PostPagingModel {
  _$_PostPagingModel({required this.total, required this.posts});

  @override
  final int total;
  @override
  final List<PostModel> posts;

  @override
  String toString() {
    return 'PostPagingModel(total: $total, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostPagingModel &&
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
  _$PostPagingModelCopyWith<_PostPagingModel> get copyWith =>
      __$PostPagingModelCopyWithImpl<_PostPagingModel>(this, _$identity);
}

abstract class _PostPagingModel implements PostPagingModel {
  factory _PostPagingModel(
      {required int total,
      required List<PostModel> posts}) = _$_PostPagingModel;

  @override
  int get total;
  @override
  List<PostModel> get posts;
  @override
  @JsonKey(ignore: true)
  _$PostPagingModelCopyWith<_PostPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
