// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_paging_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$PostPagingModelCopyWithImpl<$Res, PostPagingModel>;
  @useResult
  $Res call({int total, List<PostModel> posts});
}

/// @nodoc
class _$PostPagingModelCopyWithImpl<$Res, $Val extends PostPagingModel>
    implements $PostPagingModelCopyWith<$Res> {
  _$PostPagingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostPagingModelCopyWith<$Res>
    implements $PostPagingModelCopyWith<$Res> {
  factory _$$_PostPagingModelCopyWith(
          _$_PostPagingModel value, $Res Function(_$_PostPagingModel) then) =
      __$$_PostPagingModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, List<PostModel> posts});
}

/// @nodoc
class __$$_PostPagingModelCopyWithImpl<$Res>
    extends _$PostPagingModelCopyWithImpl<$Res, _$_PostPagingModel>
    implements _$$_PostPagingModelCopyWith<$Res> {
  __$$_PostPagingModelCopyWithImpl(
      _$_PostPagingModel _value, $Res Function(_$_PostPagingModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? posts = null,
  }) {
    return _then(_$_PostPagingModel(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
    ));
  }
}

/// @nodoc

class _$_PostPagingModel implements _PostPagingModel {
  _$_PostPagingModel(
      {required this.total, required final List<PostModel> posts})
      : _posts = posts;

  @override
  final int total;
  final List<PostModel> _posts;
  @override
  List<PostModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostPagingModel(total: $total, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostPagingModel &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostPagingModelCopyWith<_$_PostPagingModel> get copyWith =>
      __$$_PostPagingModelCopyWithImpl<_$_PostPagingModel>(this, _$identity);
}

abstract class _PostPagingModel implements PostPagingModel {
  factory _PostPagingModel(
      {required final int total,
      required final List<PostModel> posts}) = _$_PostPagingModel;

  @override
  int get total;
  @override
  List<PostModel> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_PostPagingModelCopyWith<_$_PostPagingModel> get copyWith =>
      throw _privateConstructorUsedError;
}
