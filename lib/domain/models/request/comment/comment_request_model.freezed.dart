// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentRequestModel {
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentRequestModelCopyWith<CommentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentRequestModelCopyWith<$Res> {
  factory $CommentRequestModelCopyWith(
          CommentRequestModel value, $Res Function(CommentRequestModel) then) =
      _$CommentRequestModelCopyWithImpl<$Res, CommentRequestModel>;
  @useResult
  $Res call({String postId, String userId, String content});
}

/// @nodoc
class _$CommentRequestModelCopyWithImpl<$Res, $Val extends CommentRequestModel>
    implements $CommentRequestModelCopyWith<$Res> {
  _$CommentRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentRequestModelCopyWith<$Res>
    implements $CommentRequestModelCopyWith<$Res> {
  factory _$$_CommentRequestModelCopyWith(_$_CommentRequestModel value,
          $Res Function(_$_CommentRequestModel) then) =
      __$$_CommentRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String postId, String userId, String content});
}

/// @nodoc
class __$$_CommentRequestModelCopyWithImpl<$Res>
    extends _$CommentRequestModelCopyWithImpl<$Res, _$_CommentRequestModel>
    implements _$$_CommentRequestModelCopyWith<$Res> {
  __$$_CommentRequestModelCopyWithImpl(_$_CommentRequestModel _value,
      $Res Function(_$_CommentRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? userId = null,
    Object? content = null,
  }) {
    return _then(_$_CommentRequestModel(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CommentRequestModel implements _CommentRequestModel {
  _$_CommentRequestModel(
      {required this.postId, required this.userId, required this.content});

  @override
  final String postId;
  @override
  final String userId;
  @override
  final String content;

  @override
  String toString() {
    return 'CommentRequestModel(postId: $postId, userId: $userId, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentRequestModel &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.content, content) || other.content == content));
  }

  @override
  int get hashCode => Object.hash(runtimeType, postId, userId, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentRequestModelCopyWith<_$_CommentRequestModel> get copyWith =>
      __$$_CommentRequestModelCopyWithImpl<_$_CommentRequestModel>(
          this, _$identity);
}

abstract class _CommentRequestModel implements CommentRequestModel {
  factory _CommentRequestModel(
      {required final String postId,
      required final String userId,
      required final String content}) = _$_CommentRequestModel;

  @override
  String get postId;
  @override
  String get userId;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_CommentRequestModelCopyWith<_$_CommentRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
